{
  description = "ROS 2 Jazzy Jalisco Robotics Workspace";

  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";
  };

  outputs = { self, nixpkgs, nix-ros-overlay }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-ros-overlay.overlays.default ];
      };
      rosDistro = pkgs.rosPackages.jazzy;
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "ros2-jazzy-ws";
        packages = [
          # Build tools & compilers
          pkgs.colcon
          pkgs.cmake
          pkgs.gcc
          pkgs.gnumake
          pkgs.git
          pkgs.python3Packages.setuptools
          pkgs.python3Packages.pip

          # ROS 2 Jazzy Core & CLI
          rosDistro.ros-core
          rosDistro.ros2cli
          rosDistro.ros2run
          rosDistro.ros2node
          rosDistro.ros2topic
          rosDistro.ros2service
          rosDistro.ros2param
          rosDistro.ros2launch
          rosDistro.ros2pkg
          rosDistro.ros2bag

          # Client Libraries & Build Systems
          rosDistro.rclcpp
          rosDistro.rclpy
          rosDistro.ament-cmake

          # Standard Messages
          rosDistro.std-msgs
          rosDistro.geometry-msgs
          rosDistro.sensor-msgs
          rosDistro.nav-msgs

          # Transforms (TF2)
          rosDistro.tf2
          rosDistro.tf2-ros
          rosDistro.tf2-geometry-msgs
        ];

        shellHook = ''
          echo "=========================================="
          echo "  🤖 ROS 2 Jazzy Jalisco Workspace Ready  "
          echo "=========================================="
          echo "  ROS_DISTRO : jazzy"
          echo "  Workspace  : $(pwd)"
          echo "=========================================="
        '';
      };
    };
}
