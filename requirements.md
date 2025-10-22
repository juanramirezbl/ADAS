# Especificación de Requisitos

## Requisitos Funcionales:

* **RF1: Visualización de la cámara:**
    * **Descripción:** La app debe mostrar en la pantalla la vista de la cámara trasera del iPhone en tiempo real y a pantalla completa (o casi completa).
    * **Historia de Usuario:** Como usuario, quiero ver la imagen en vivo de la cámara para poder apuntarla correctamente hacia la carretera.

* **RF2: Detección de Señales de Velocidad:**
    * **Descripción:** El sistema debe analizar el flujo de vídeo para identificar y reconocer señales de tráfico de límite de velocidad (usando el modelo YOLO entrenado).
    * **Historia de Usuario:** Como usuario, quiero que la app analice la carretera y detecte las señales de velocidad por mí.

* **RF4: Alerta Acústica (Sonido):**
    * **Descripción:** El sistema debe reproducir un sonido de notificación breve y claro en el momento en que se detecta una nueva señal.
    * **Historia de Usuario:** Como usuario, quiero oír un sonido de alerta para ser notificado de un límite de velocidad sin tener que mirar la pantalla.

* **RF5: Acceso a historial de detecciones:**
    * **Descripción:** El usuario debe poder navegar a una pantalla de "Historial" desde el menú principal de Configuración.
    * **Historia de Usuario:** Como usuario, quiero poder acceder a un historial para revisar las señales que la app ha detectado recientemente.

* **RF6: Registro de detección:**
    * **Descripción:** Cada vez que se detecta una nueva señal de velocidad, el sistema debe guardar la información relevante (tipo de señal y hora) en un registro persistente.
    * **Historia de Usuario:** Como usuario, quiero que la app guarde un registro de las señales que detecta para poder consultarlas más tarde.

* **RF7: Acceso al Menú de Configuración**
    * **Descripción:** El usuario debe poder navegar a una pantalla de "Configuración".
    * **Historia de Usuario:** Como usuario, quiero poder acceder a un menú de ajustes para personalizar la app.

* **RF8: Control de Alerta Acústica**
    * **Descripción:** El menú de configuración debe tener un interruptor (toggle switch) para activar o desactivar la alerta acústica (RF4).
    * **Historia de Usuario:** Como usuario, quiero poder silenciar las alertas sonoras si estoy en una llamada o escuchando música.

* **RF9: Borrado de historial:**
    * **Descripción:** La pantalla de "Historial" debe incluir un botón para "Borrar historial", permitiendo al usuario limpiar el registro manualmente.
    * **Historia de Usuario:** Como usuario, quiero poder borrar el historial de detecciones cuando empiezo un nuevo viaje.

---

## REQUISITOS NO FUNCIONALES:

* **RNF 1: Rendimiento (Tiempo Real)**
    * **Descripción:** La app debe procesar el vídeo y ejecutar el modelo de IA de forma fluida, sin tirones (lag) perceptibles.
    * **Criterio:** El sistema debe mantener una tasa de procesamiento estable de al menos 15 fotogramas por segundo (FPS) durante la detección activa.

* **RNF 2: Precisión del Modelo**
    * **Descripción:** El modelo YOLO Nano entrenado debe ser fiable en la identificación de señales de velocidad.
    * **Criterio:** El modelo debe alcanzar una precisión (mAP @ .50) superior al 90% en el conjunto de datos de validación.

* **RNF 3: Eficiencia de Recursos (Batería y Calor)**
    * **Descripción:** La app debe gestionar los recursos del sistema para evitar un impacto negativo en el dispositivo.
    * **Criterio:** El uso continuado de la app (ej. 20 minutos) no debe causar un sobrecalentamiento excesivo del dispositivo ni un consumo de batería desproporcionado.

* **RNF 4: Procesamiento en el Dispositivo (Privacidad)**
    * **Descripción:** Toda la lógica de IA y procesamiento de vídeo debe ocurrir localmente en el iPhone.
    * **Criterio:** La aplicación debe ser 100% funcional sin conexión a internet. No se enviará ningún dato de vídeo o detección a un servidor externo, garantizando la privacidad del usuario.

* **RNF 5: Compatibilidad**
    * **Descripción:** La aplicación debe funcionar en la mayoría de los iPhones modernos.
    * **Criterio:** La app debe ser compatible con cualquier dispositivo que ejecute iOS 17 o una versión posterior.

* **RNF 6: Fiabilidad**
    * **Descripción:** La aplicación debe ser estable y no cerrarse inesperadamente.
    * **Criterio:** La app no debe sufrir crashes (cierres inesperados) durante su bucle de funcionamiento principal (la detección de vídeo).

* **RNF 7: Persistencia de Datos**
    * **Descripción:** Las preferencias del usuario y el historial deben guardarse localmente en el dispositivo.
    * **Criterio:** Las opciones del menú (ej. sonido activado/desactivado) deben persistir entre sesiones usando UserDefaults. El historial de detecciones se guardará localmente (ej. en un archivo JSON) para persistir después de cerrar la app.

* **RNF 8: Soporte de Modo Claro y Oscuro**
    * **Descripción:** La interfaz de la aplicación debe adaptarse a la configuración del sistema.
    * **Criterio:** La app debe respetar y mostrarse correctamente tanto en el Modo Claro como en el Modo Oscuro de iOS.
