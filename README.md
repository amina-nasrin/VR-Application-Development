# String Navigation: Teleportation without Spatial Disorientation

Welcome to the **String Navigation** project — a lightweight VR system that enhances spatial orientation during teleportation by visualizing the traveled path and integrating a Mini-Map.

## Project Overview

Teleportation in VR often causes **spatial disorientation** by eliminating intermediate visual feedback during movement.
**String Navigation** addresses this by:

* **Tracking** the user's teleportation path with a virtual thread ("String")
* **Visualizing** the path on-demand using simple **gestural commands**
* **Providing** a **Mini-Map** for instant overview of traveled and unexplored areas
* **Maintaining** VR immersion with minimal cognitive load and without causing cybersickness

This project was implemented using **Godot 4.3**, targeting **Meta Quest 3** through **WebXR** and **OpenXR** compatibility.

## Features

* 📍 **String Visualization**: Continuous tracking of teleportation paths
* 🗺️ **Mini-Map Integration**: Top-down map displaying the environment and path
* ✋ **Gestural Control**: Simple gestures toggle the String and Mini-Map visibility
* 🌎 **Lightweight Design**: Real-time, low-overhead tracking and visualization
* 🧠 **Improved Usability**: Reduces disorientation, improves task performance and presence

## Development Environment

* **Engine**: Godot 4.3
* **Target Device**: Meta Quest 3
* **Host OS**: Windows 11
* **Language**: GDScript

## Controls

* **Show Mini-Map**: Perform a "C" shaped hand gesture (left controller)
* **Show String Path**: Perform a "Point" gesture (left controller)

## Folder Structure (Typical)

```
/scenes
  /Tracker.tscn   # Scene for tracking teleportation points
  /MiniMap.tscn   # Scene for Mini-Map setup
/scripts
  /StringNavigation.gd # Main tracking and drawing logic
/assets
  /materials       # String materials
  /icons           # Mini-Map icons
README.md
```

## Setup Instructions

1. Clone or download this repository.
2. Open the project with **Godot 4.3**.
3. Ensure WebXR and OpenXR plugins are configured for your target platform.
4. Deploy the project to your Meta Quest 3 headset.
5. Use teleportation inside the VR environment and activate the String or Mini-Map as needed with gestures.

## Publications

This project is based on the work:

> Amina Nasrin, Isayas Adhanom,
> *String Navigation: Teleportation without Spatial Disorientation*,
> Texas State University, 2025.

## Acknowledgments

* Department of Computer Science, Texas State University
* Dr. Isayas Adhanom for guidance and support

---

Would you also like a slightly more "GitHub-polished" version with badges (e.g., Godot, License, Meta Quest)? 🎯
I can generate that too if you want!
