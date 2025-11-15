
import UIKit
import AVFoundation // For camera
import Vision      // For Core ML

class RealTimeViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    // 1. VISION & CORE ML
    private var visionRequest: VNCoreMLRequest?
    
    // A layer to draw the bounding boxes on
    private var drawingLayer: CALayer!

    
    // 2. AV FOUNDATION (CAMERA)
    // --------------------------
    // The main session that manages camera input and output
    private let captureSession = AVCaptureSession()
    
    // A layer to show the camera feed
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    // A background queue for processing frames
    private let dataOutputQueue = DispatchQueue(
        label: "com.example.videoDataQueue",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem
    )
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupVision()
        self.setupCamera()
        
        // Start the camera session
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    // This function runs when the view's orientation or size changes
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let previewLayer = self.previewLayer {
            previewLayer.frame = self.view.bounds
        }
        if let drawingLayer = self.drawingLayer {
            drawingLayer.frame = self.view.bounds
        }
    }
    
    // MARK: - Core ML & Vision Setup
    
    private func setupVision() {
        // 1. Load your model
        // (CRITICAL: Change "YOLOv3Tiny" if your model file has a different class name)
        guard let model = try? VNCoreMLModel(for: YOLOv3Tiny().model) else {
            fatalError("Could not load Core ML model. Check the model name.")
        }

        // 2. Create a Vision request
        self.visionRequest = VNCoreMLRequest(model: model, completionHandler: self.handleDetections)
        self.visionRequest?.imageCropAndScaleOption = .scaleFill
    }
    
    // MARK: - Camera (AVFoundation) Setup
    
    private func setupCamera() {
        // --- 1. Configure the Session ---
        self.captureSession.sessionPreset = .vga640x480

        // --- 2. Get the Camera Device ---
        guard let cameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Error: Could not find back camera.")
            return
        }
        
        // --- 3. Set the Camera Input ---
        do {
            let cameraInput = try AVCaptureDeviceInput(device: cameraDevice)
            if self.captureSession.canAddInput(cameraInput) {
                self.captureSession.addInput(cameraInput)
            }
        } catch {
            print("Error setting camera input: \(error)")
            return
        }
        
        // --- 4. Set the Camera Output ---
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.alwaysDiscardsLateVideoFrames = true // Don't build up a queue of old frames
        videoOutput.setSampleBufferDelegate(self, queue: self.dataOutputQueue)
        
        if self.captureSession.canAddOutput(videoOutput) {
            self.captureSession.addOutput(videoOutput)
        }
        
        videoOutput.connection(with: .video)?.isEnabled = true

        // --- 5. Set up the Preview Layer ---
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.previewLayer.videoGravity = .resizeAspectFill // Fill the screen
        self.previewLayer.frame = self.view.bounds
        self.view.layer.addSublayer(self.previewLayer)
        
        // --- 6. Set up the Drawing Layer ---
        self.drawingLayer = CALayer()
        self.drawingLayer.frame = self.view.bounds
        self.drawingLayer.opacity = 0.7
        self.view.layer.addSublayer(self.drawingLayer) // Add it ON TOP of the preview layer
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    
    // This is the function that gets called FOR EVERY FRAME from the camera
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        guard let request = self.visionRequest else {
            return
        }

        // Perform the Vision request on this pixel buffer
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform Vision request: \(error)")
        }
    }
    
    // MARK: - Handle Detections
    
    // This function is the "completionHandler" for the Vision request
    private func handleDetections(request: VNRequest, error: Error?) {
        if let error = error {
            print("Vision request failed: \(error.localizedDescription)")
            return
        }
        
        guard let results = request.results as? [VNRecognizedObjectObservation] else {
            return
        }
        
        // Update the UI on the main thread
        DispatchQueue.main.async {
            self.drawBoundingBoxes(observations: results)
        }
    }
    
    // MARK: - Drawing Functions
    
    private func clearDrawings() {
        self.drawingLayer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    private func drawBoundingBoxes(observations: [VNRecognizedObjectObservation]) {
        // 1. Clear old boxes
        self.clearDrawings()
        
        // 2. Get the size of the layer we are drawing on
        let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -self.drawingLayer.frame.height)
        let scale = CGAffineTransform.identity.scaledBy(x: self.drawingLayer.frame.width, y: self.drawingLayer.frame.height)
        
        // 3. Loop through all detections
        for observation in observations {
            guard let topLabel = observation.labels.first else { continue }
            
            // Only draw if confidence is high (e.g., > 50%)
            if topLabel.confidence < 0.5 { continue }
            
            // --- Create the Bounding Box Layer ---
            let bounds = observation.boundingBox
            let rect = bounds.applying(scale).applying(transform)

            let boxLayer = CALayer()
            boxLayer.frame = rect
            boxLayer.borderWidth = 3
            boxLayer.borderColor = UIColor.red.cgColor
            boxLayer.cornerRadius = 4
            self.drawingLayer.addSublayer(boxLayer)
            
            // --- Create the Text Label Layer ---
            let textLayer = CATextLayer()
            textLayer.string = "\(topLabel.identifier) \(String(format: "%.2f", topLabel.confidence))"
            textLayer.fontSize = 14
            textLayer.foregroundColor = UIColor.red.cgColor
            textLayer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
            textLayer.cornerRadius = 4
            // Position the text label slightly above the box
            textLayer.frame = CGRect(x: rect.origin.x, y: rect.origin.y - 20, width: rect.width, height: 20)
            
            self.drawingLayer.addSublayer(textLayer)
        }
    }
}
