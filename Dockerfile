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

# ros 2 env
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc
RUN echo "[[ -d /opt/ros_ws/install ]] && source /opt/ros_ws/install/setup.sh" \
	>> /root/.bashrc

# ros 2 workspace
RUN mkdir -p /opt/ros_ws/src

# ros2_laser_scan_merger
RUN cd /opt/ros_ws/src && \
	wget https://github.com/mich1342/ros2_laser_scan_merger/archive/refs/heads/main.zip && \
	unzip main.zip && rm main.zip && \
	mv ros2_laser_scan_merger-main ros2_laser_scan_merger && \
	cd ../ && \
	. /opt/ros/jazzy/setup.sh && \
	colcon build --symlink-install --packages-select ros2_laser_scan_merger

# common commands added to history
RUN echo "ros2 run teleop_twist_keyboard teleop_twist_keyboard" \
        >> /root/.bash_history
RUN echo "source /opt/ros_ws/install/setup.sh" \
        >> /root/.bash_history
RUN echo "cd /opt/ros_ws" \
        >> /root/.bash_history
