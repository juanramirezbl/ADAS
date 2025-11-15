
# Documento de Requisitos (RF, RNF, RUI, RTFG)

---

## ✅ **RF: Requisitos Funcionales (Core)**
Funciones básicas que la app debe cumplir.

### **RF 001 — Captura de Vídeo**  
La aplicación deberá acceder a la cámara trasera del dispositivo y mostrar el feed de vídeo en tiempo real.

### **RF 002 — Carga de Modelo ML**  
La aplicación deberá cargar un modelo Core ML (.mlmodel) entrenado para la detección de señales de tráfico (YOLOv3Tiny).

### **RF 003 — Detección de Señales**  
La aplicación deberá procesar los fotogramas usando Vision para detectar señales de límite de velocidad.

### **RF 004 — Visualización de Detección**  
La aplicación superpondrá la información de la señal detectada (p. ej. el número **"50"**) sobre la vista de la cámara.

### **RF 005 — Obtención de Velocidad GPS**  
La aplicación usará CoreLocation para obtener y mostrar la velocidad actual del vehículo.

### **RF 006 — Comparación de Velocidad**  
El sistema comparará en tiempo real la velocidad del GPS con el último límite detectado.

### **RF 007 — Alerta de Exceso de Velocidad**  
Si la velocidad supera el límite (más un margen configurable), el sistema emitirá una alerta visual, sonora o por vibración.

### **RF 008 — Persistencia de Límite**  
El último límite detectado permanecerá visible en la interfaz hasta que haya uno nuevo o se reinicie el modo conducción.

---

## ⚙️ **RNF: Requisitos No Funcionales (Técnicos y Rendimiento)**

### **RNF 001 — Eficiencia de Inferencia**  
El procesamiento del modelo ML no deberá exceder los **15 FPS** para controlar batería y calor.

### **RNF 002 — Gestión de Hilos**  
Toda la inferencia ML se ejecutará en **background thread**; la UI deberá correr en el **main thread**.

### **RNF 003 — Filtrado de Confianza**  
Solo se considerarán válidas detecciones con un umbral mínimo (ej. **80%** de confianza).

### **RNF 004 — Compatibilidad**  
Compatible con **Swift 5.x** e **iOS 15 o superior**.

### **RNF 005 — Persistencia de Ajustes**  
Las preferencias del usuario (UserDefaults) deberán persistir entre sesiones.

---

## 🎨 **RUI: Requisitos de Interfaz de Usuario y Experiencia (UX)**

### **RUI 001 — Pantalla de Menú Principal**  
Una pantalla inicial servirá como punto de navegación principal.

### **RUI 002 — Navegación Principal**  
Desde el Menú Principal, el usuario podrá acceder a:  
- **a)** Iniciar Conducción  
- **b)** Ajustes  
- **c)** Historial

### **RUI 003 — Pantalla de Ajustes**  
El usuario podrá configurar:
- **RUI-003a:** Activar/Desactivar alertas de sonido  
- **RUI-003b:** Activar/Desactivar vibración  
- **RUI-003c:** Seleccionar margen de tolerancia (+0, +5, +10 km/h)  
- **RUI-003d:** Activar/Desactivar modo HUD  

### **RUI 004 — Interfaz de Conducción Minimalista**  
La pantalla de conducción mostrará exclusivamente la información esencial.

### **RUI 005 — Alerta Visual Clara**  
En caso de exceso de velocidad, la interfaz deberá destacar de forma inequívoca (p. ej. tonalidad roja).

### **RUI 006 — Modo HUD**  
La app ofrecerá un modo que invierte horizontalmente la interfaz para proyectarla en el parabrisas.


