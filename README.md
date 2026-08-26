# 🤖 ROS 2 Jazzy Jalisco — Robotics Workspace

[![ROS 2](https://img.shields.io/badge/ROS_2-Jazzy_Jalisco-3498db?style=for-the-badge&logo=ros&logoColor=white)](https://docs.ros.org/en/jazzy/)
[![Nix Flakes](https://img.shields.io/badge/Nix-Flakes_Enabled-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org/)
[![Reproducible](https://img.shields.io/badge/Build-100%25_Reproducible-2ecc71?style=for-the-badge)]()
[![Platform](https://img.shields.io/badge/Platform-Linux_x86__64-orange?style=for-the-badge&logo=linux&logoColor=white)]()

A modern, declarative, and 100% reproducible **ROS 2 Jazzy Jalisco** robotics workspace powered by **Nix Flakes**, **`nix-ros-overlay`**, and **`direnv`**.

---

## ⚡ Key Highlights

- **Zero Host Contamination:** Fully isolated development environment; no `sudo apt install` or global pollution.
- **Zero Dependency Hell:** All packages, compilers (GCC/CMake), Python dependencies, and ROS 2 middleware are pinned deterministically via `flake.lock`.
- **Instant Activation:** Powered by `direnv` + `nix-direnv` for 0ms environment loading upon entering the directory.
- **Client Libraries & Math Ready:** Pre-configured with `rclcpp`, `rclpy`, `TF2` (Transform library), `geometry_msgs`, `sensor_msgs`, `nav_msgs`, and `rosbag2`.

---

## 📁 Repository Structure

```text
ros2_ws/
├── .direnv/          # Local direnv cache (gitignored)
├── .envrc            # Direnv hook (use flake)
├── .gitignore        # Ignores build/, install/, log/, and cache
├── flake.nix         # Declarative ROS 2 workspace environment definition
├── flake.lock        # Cryptographically locked dependency graph
├── README.md         # Workspace documentation and guide
└── src/              # Source code directory for custom ROS 2 packages
```

---

## 🚀 Getting Started

### Prerequisites
- **Nix** with Flakes enabled (`nix-command flakes`).
- **direnv** *(Optional, but recommended for zero-friction auto-loading)*.

### 1. Clone the Workspace
```bash
git clone git@github.com:MANNUS1/ros2_ws.git
cd ros2_ws
```

### 2. Enter the Environment

**With `direnv` (Recommended):**
```bash
direnv allow
# Environment loads automatically whenever you enter the folder!
```

**Without `direnv` (Manual):**
```bash
nix develop
```

---

## 🛠️ Development Workflow

### Creating a New ROS 2 Package

Navigate to `src/` and use `ros2 pkg create`:

```bash
cd src

# Python Package
ros2 pkg create --build-type ament_python my_robot_pkg --dependencies rclpy std_msgs geometry_msgs

# C++ Package
ros2 pkg create --build-type ament_cmake my_cpp_robot_pkg --dependencies rclcpp std_msgs geometry_msgs
```

### Building Packages (`colcon`)

From the root of the workspace:
```bash
# Build all packages with symlink install (fast iteration)
colcon build --symlink-install

# Or build a specific package
colcon build --symlink-install --packages-select my_robot_pkg
```

### Sourcing the Local Overlay
```bash
source install/setup.bash   # for bash
# or
source install/setup.zsh    # for zsh
```

### Verifying Nodes & Topics
```bash
# List active nodes and topics
ros2 node list
ros2 topic list

# Echo data stream
ros2 topic echo /my_topic
```

---

## 🗺️ Mechatronics & Robotics Roadmap

```text
 [ PHASE 1 ] Fundamentals & Pub/Sub ──> [ PHASE 2 ] 3D Frames & TF2
                                                       │
 [ PHASE 4 ] Perception & SLAM <──── [ PHASE 3 ] Physics & Gazebo Sim
          │
          ▼
 [ PHASE 5 ] Autonomous Nav (Nav2) ──> [ PHASE 6 ] Embedded Hardware (micro-ROS)
```

| Phase | Core Competency | Practical Milestone |
|---|---|---|
| **Phase 1: Nodes & Communication** | Pub/Sub, Services, Parameters with `rclpy` & `rclcpp`. | Telemetry node + motor command processor. |
| **Phase 2: Spatial Transforms** | Spatial coordinate frames with `TF2` and `URDF` modeling. | Visualizing dynamic kinematics in **RViz2**. |
| **Phase 3: Physical Simulation** | **Gazebo Harmonic** + `ros_gz_bridge`. | Simulating a differential drive robot with virtual LiDAR. |
| **Phase 4: Perception & SLAM** | Point clouds, laser scans, and `slam_toolbox`. | Real-time 2D/3D map generation. |
| **Phase 5: Autonomous Navigation** | Global/Local path planning with **Nav2**. | Autonomous obstacle avoidance and goal navigation. |
| **Phase 6: Embedded Hardware** | **micro-ROS** + `ros2_control`. | Interfacing microcontrollers (ESP32/STM32) with physical actuators. |

---

## 📄 License & Attribution

Maintained by **Manuel Aranda (Manu)**. Built with [nix-ros-overlay](https://github.com/lopsided98/nix-ros-overlay) and [Open Robotics](https://www.ros.org/).
