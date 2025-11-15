

import SwiftUI

struct DetectionView: View {
    var body: some View {
        // Use the "bridge" to show your camera view
        // .ignoresSafeArea() makes it fill the whole screen,
        // including behind the notch and home bar.
        CameraViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    DetectionView()
}
