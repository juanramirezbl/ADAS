import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                
                VStack(spacing: 10) {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.8), lineWidth: 2)
                        )
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                        .padding(.top, 40)
                    
                    Text("Bienvenido")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                    
                }
                
                Spacer()
                
                // ---Features---
                
                // CameraButton
                NavigationLink {
                    DetectionView()
                        .navigationTitle("Modo Conducción")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    HStack {
                        Image(systemName: "car.fill")
                            .font(.title2)
                        Text("Iniciar Conducción")
                            .fontWeight(.bold)
                            .font(.title3)
                    }
                    .foregroundColor(.purple)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                }
                
                // SettingsButton
                NavigationLink {
                    Text("Settings Screen")
                } label: {
                    HStack {
                        Image(systemName: "gearshape.fill")
                        Text("Ajustes")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                }
                
                // HistoryButton
                NavigationLink {
                    Text("Historial")
                } label: {
                    HStack {
                        Image(systemName: "clock.fill")
                        Text("Historial")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                }
                
                Spacer()
                
                // Footer
                Text("Versión 1.0 - TFG Ingeniería")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.bottom, 20)
            }
            .padding(30)
        }
        .toolbar(.hidden, for: .navigationBar) //hidentoolbar
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
