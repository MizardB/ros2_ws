# ROS 2 Jazzy Jalisco Robotics Workspace

Declarative ROS 2 workspace powered by Nix Flakes and `nix-ros-overlay`.

## Quick Start

### 1. Enter the Environment
```bash
nix develop
```
*(Or navigate into the directory with `direnv` enabled).*

### 2. Build Packages
```bash
colcon build --symlink-install
```

### 3. Source Workspace Overlay
```bash
source install/setup.bash  # or setup.zsh
```

### 4. Create a New Package
```bash
cd src
# Python package:
ros2 pkg create --build-type ament_python my_robot_pkg --dependencies rclpy std_msgs

# C++ package:
ros2 pkg create --build-type ament_cmake my_cpp_robot_pkg --dependencies rclcpp std_msgs
```
