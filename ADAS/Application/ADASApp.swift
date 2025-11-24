import SwiftUI

@main
struct ADASApp: App {
    
    // read presetting set by user
    @AppStorage("selectedAppearance") private var selectedAppearance = 0
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .preferredColorScheme(selectedAppearance == 1 ? .light : selectedAppearance == 2 ? .dark : nil)
        }
    }
}
