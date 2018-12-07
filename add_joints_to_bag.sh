#!/bin/bash

. /home/joe/catkin_ws/devel/setup.bash

export ROS_HOME=`pwd`

for file in clean/*.bag
do
    fname=${file##*/}
    echo "Copying" $fname "to" `pwd`
    cp $file .
    zipname=${fname%.bag}.zip
    echo "Unzipping" $zipname
    unzip $zipname
    echo "Launching joint adder node"
    roslaunch fyp add_joints_to_bag.launch fname:=`pwd`/$fname
    echo "Removing json files"
    rm *.json
    echo "mv with_joints.bag" $fname
    mv with_joints.bag $fname
done

unset ROS_HOME
