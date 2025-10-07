# ADAS-iOS: Real-Time Lane, Sign & Pedestrian Detection

**Brief:** A mobile ADAS prototype for iPhone that runs entirely on-device.  
It provides three real-time features: lane departure warning, traffic sign recognition, and pedestrian detection.  
Built with **Core ML** + **Swift**, using quantized models for low latency and battery efficiency.

## Project Goals (MVP)
- Lane departure warning 
- Speed-limit sign recognition (last seen)
- Pedestrian detection + alert
- 12–15 FPS on-device

## Phases
1. Data & Baselines 
2. Light training & export (Core ML / INT8)
3. iOS app + pipeline (camera → inference → overlay)
4. Optimization (FPS, stability)
5. Field validation
6. Thesis & delivery

## Repo Structure
- `docs/` — plans, logs, metrics, datasets notes  
- `notebooks/` — experiments & baselines  
- `scripts/` — utilities (download/visualization)  
- `src/` — reusable code  
- `data/raw/` — datasets (not tracked)  
- `models/` — exported models (.mlmodel)  
- `outputs/` — example images/videos with overlays
