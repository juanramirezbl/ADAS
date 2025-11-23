import SwiftUI

struct SplashView: View {
    // Estado para controlar si la "carga" ha terminado
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            
            NavigationStack {
                HomeView()
            }
        } else {
            ZStack {
                //background
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo, Color.blue]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 40)
                        .frame(width: 300, height: 300)
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 80)
                        .frame(width: 600, height: 600)
                }
                
                VStack(spacing: 20) {
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.8), lineWidth: 2)
                        )
                        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
                    
                    Text("ADAS")
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .tracking(2)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
