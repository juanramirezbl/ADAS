
import SwiftUI
import UIKit

// This struct is the "bridge" between SwiftUI and UIKit
struct CameraViewRepresentable: UIViewControllerRepresentable {
    
    // 1.the UIKit view controller
    func makeUIViewController(context: Context) -> RealTimeViewController {
        return RealTimeViewController()
    }
    
    // 2.passing data from SwiftUI TO UIKit
    func updateUIViewController(_ uiViewController: RealTimeViewController, context: Context) {
        
    }
}
