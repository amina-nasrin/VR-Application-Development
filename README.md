# String Navigation: Teleportation without Spatial Disorientation

A lightweight VR system that enhances spatial orientation during teleportation by visualizing the traveled path and integrating a Mini-Map.

## Project Overview

![IMG_1876](https://github.com/user-attachments/assets/df81c87e-0dcd-4a7d-9a61-b8ae6c83b9b1)


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

  
![sn_v1](https://github.com/user-attachments/assets/9cb2b48b-4a4a-4ffe-92d3-237b3f835667)
![sn_v2](https://github.com/user-attachments/assets/312a3943-2480-44ca-a422-321a00037182)

## Setup Instructions

1. Clone or download this repository.
2. Open the project with **Godot 4.3**.
3. Ensure WebXR and OpenXR plugins are configured for your target platform.
4. Deploy the project to your Meta Quest 3 headset.
5. Use teleportation inside the VR environment and activate the String or Mini-Map as needed with gestures.
