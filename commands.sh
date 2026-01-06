#!/bin/sh

# ros 2 env
echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc
echo "[[ -d /opt/ros_ws/install ]] && source /opt/ros_ws/install/setup.sh" \
	>> /root/.bashrc

# ros 2 workspace
mkdir -p /opt/ros_ws/src

# ros2_laser_scan_merger
cd /opt/ros_ws/src && \
	wget https://github.com/mich1342/ros2_laser_scan_merger/archive/refs/heads/main.zip && \
	unzip main.zip && rm main.zip && \
	mv ros2_laser_scan_merger-main ros2_laser_scan_merger && \
	cd ../ && \
	. /opt/ros/jazzy/setup.sh && \
	colcon build --symlink-install --packages-select ros2_laser_scan_merger

# common commands added to history
echo "ros2 teleop_twist_keyboard teleop_twist_keyboard" \
        >> /root/.bash_history
echo "source /opt/ros_ws/install/setup.sh" \
        >> /root/.bash_history
echo "cd /opt/ros_ws" \
        >> /root/.bash_history
