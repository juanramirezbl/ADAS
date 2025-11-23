

import SwiftUI

struct DetectionView: View {
    var body: some View {
        CameraViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    DetectionView()
}
