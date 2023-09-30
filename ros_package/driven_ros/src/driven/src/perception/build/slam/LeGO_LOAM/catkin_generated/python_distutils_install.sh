#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/src/slam/LeGO_LOAM"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/install/lib/python2.7/dist-packages:/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/build" \
    "/usr/bin/python2" \
    "/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/src/slam/LeGO_LOAM/setup.py" \
     \
    build --build-base "/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/build/slam/LeGO_LOAM" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/install" --install-scripts="/home/driven/driven/Driven_autonomous_driving/ros_pakage/driven_ros/src/driven/src/perception/install/bin"
