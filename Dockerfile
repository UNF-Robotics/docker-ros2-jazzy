FROM ros:jazzy-ros-core-noble

# update base system
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	libpcl-dev \
	libusb-1.0-0-dev \
	python3-colcon-devtools \
	python3-colcon-package-selection \
	python3-colcon-ros \
	ros-dev-tools \
	ros-jazzy-ament-lint-auto \
	ros-jazzy-controller-manager \
	ros-jazzy-depthimage-to-laserscan \
	ros-jazzy-joint-limits \
	ros-jazzy-joint-state-publisher \
	ros-jazzy-joy-linux \
	ros-jazzy-joy-teleop \
	ros-jazzy-pcl-conversions \
	ros-jazzy-pointcloud-to-laserscan \
	ros-jazzy-robot-state-publisher \
	ros-jazzy-ros2-controllers \
	ros-jazzy-ros2launch \
	ros-jazzy-rplidar-ros \
	ros-jazzy-slam-toolbox \
	ros-jazzy-teleop-twist-keyboard \
	ros-jazzy-xacro \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

# ros 2 env, workspace, ros2_laser_scan_merger, etc
COPY commands.sh ./commands.sh

RUN chmod +x ./commands.sh && sync && ./commands.sh
