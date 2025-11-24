import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedAppearance") private var selectedAppearance = 0
    
    // still not used
    @AppStorage("enableSound") private var enableSound = true
    @AppStorage("enableHaptics") private var enableHaptics = true
    
    var body: some View {
            Form {
                // Section 1: Appareance
                Section(header: Text("Pantalla y Brillo")) {
                    Picker(selection: $selectedAppearance, label: Text("Apariencia")) {
                        HStack {
                            Image(systemName: "iphone")
                            Text("Automático")
                        }.tag(0)
                        
                        HStack {
                            Image(systemName: "sun.max.fill")
                            Text("Claro")
                        }.tag(1)
                        
                        HStack {
                            Image(systemName: "moon.fill")
                            Text("Oscuro")
                        }.tag(2)
                    }
                    .pickerStyle(.inline)
                }
                .listRowSeparator(.hidden)
                
                // SECTION 2: SECURITY
                Section(header: Text("Alertas de Conducción")) {
                    Toggle(isOn: $enableSound) {
                        HStack {
                            Image(systemName: "speaker.wave.2.fill")
                                .foregroundColor(.purple)
                            Text("Sonido de Alerta")
                        }
                    }
                    
                    Toggle(isOn: $enableHaptics) {
                        HStack {
                            Image(systemName: "iphone.radiowaves.left.and.right")
                                .foregroundColor(.purple)
                            Text("Vibración")
                        }
                    }
                }
                
                // SECCIÓN 3: INFO TFG
                Section(header: Text("Acerca de")) {
                    HStack {
                        Text("Versión")
                        Spacer()
                        Text("1.0 (Beta)")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Desarrollado por")
                        Spacer()
                        Text("Juan Ramírez") //
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Ajustes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    NavigationStack {
        SettingsView()
    }
}
   
