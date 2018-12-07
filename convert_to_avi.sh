#!/bin/bash

. /home/joe/catkin_ws/devel/setup.bash

find -name "*.avi" -delete

mv clean/*.bag .

for file in *.bag
do
    roslaunch fyp bag_to_avi.launch fname:=`pwd`/$file
done

mv *.bag clean

tar -zcvf data.tar.gz *.avi
