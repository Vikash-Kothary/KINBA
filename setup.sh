#!/bin/bash
# setup.sh - Setup project

# Install Java, if not already installed
sudo apt-get -qq update
sudo apt-get -qq upgrade
if [ -n `which java` ]; then
    sudo apt-get install -y default-jre
    sudo apt-get install -y default-jdk
fi
if [ -n `which virtualenv` ]; then
    sudo apt-get install virtualenv
fi

# Setup virtual environment
virtualenv venv
source venv/bin/activate

# Install MyRobotLab
FILENAME='myrobotlab.jar'
LATEST_VERSION="1.0.1758"
if [ ! -f $FILENAME ]; then

	# Download latest MyRobotLab file
    wget "https://github.com/MyRobotLab/myrobotlab/releases/download/${LATEST_VERSION}/${FILENAME}"

    # Install all required MyRobotLab services
    java -jar $FILENAME -install OpenCV

    # Set project to run on boot
    # boot.sh

fi

# Run MyRobotLab
java -jar $FILENAME
