import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {

            Text("Pulse")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)

            Spacer()

            // Button to cammera
            NavigationLink {
                DetectionView()
                    .navigationTitle("Driving Mode")
                    .navigationBarTitleDisplayMode(.inline)
            } label: {
                Text("Start Driving")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Button examples still not view for settings
            NavigationLink {
                // SettingsView()
                Text("Settings Screen")
            } label: {
                Text("Settings")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.primary)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Menu")
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
