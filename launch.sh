#!/usr/bin/env bash

TB_GAZEBO_PATH=~/catkin_ws/src/turtlebot3_simulations/turtlebot3_gazebo
TERMINAL_COMMAND="gnome-terminal"

if [ $# -gt 0 ] && [ $1 == 'setup' ]; then
	echo "copying files..." 
	cp aula_m.world $TB_GAZEBO_PATH/worlds
	cp ros_homework_2.launch $TB_GAZEBO_PATH/launch
	cp -r models $TB_GAZEBO_PATH/models
fi

echo "Launching ROS simulation" 
COMMON="cd ~/catkin_ws; source devel/setup.bash; export TURTLEBOT3_MODEL=waffle"
CMD_1="$COMMON; roslaunch turtlebot3_gazebo ros_homework_2.launch" 
CMD_2="$COMMON; roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/catkin_ws/src/ros_homework_2/map.yaml"
CMD_3="$COMMON; rosrun rviz rviz -d `rospack find turtlebot3_navigation`/rviz/turtlebot3_nav.rviz"

$TERMINAL_COMMAND -- bash -c "exit 0" > /dev/null 2> /dev/null

if [ $? -ne 0 ]; then
	echo "Set your terminal exporting the variable TERMINAL_COMMAND" 
	exit -1
fi


$TERMINAL_COMMAND -- bash -c "$CMD_1"
sleep 8
$TERMINAL_COMMAND -- bash -c "$CMD_2"
sleep 5
$TERMINAL_COMMAND -- bash -c "$CMD_3"

