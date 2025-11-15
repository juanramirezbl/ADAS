
import SwiftUI
import UIKit

// This struct is the "bridge" between SwiftUI and UIKit
struct CameraViewRepresentable: UIViewControllerRepresentable {
    
    // 1. This creates the UIKit view controller
    func makeUIViewController(context: Context) -> RealTimeViewController {
        return RealTimeViewController()
    }
    
    // 2. This is for passing data from SwiftUI TO UIKit, which we don't need
    func updateUIViewController(_ uiViewController: RealTimeViewController, context: Context) {
        
    }
}
