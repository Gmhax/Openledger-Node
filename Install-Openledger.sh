#!/bin/bash
echo "-----------------------------------------------------------------------------"
echo "  EEEE  DDDD   SSSS"
echo "  E     D   D  S"
echo "  EEEE  D   D  SSSS"
echo "  E     D   D     S"
echo "  EEEE  DDDD   SSSS"
echo "-----------------------------------------------------------------------------"



# Create directory for Openledger
mkdir Openledger

# Navigate into the Openledger directory
cd Openledger

# Upgrade the system
sudo apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Download Openledger Node package
wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip

# Unzip the Openledger Node package
unzip openledger-node-1.0.0-linux.zip

# Install the Openledger Node package
sudo apt install ./openledger-node-1.0.0.deb

# Update the system again
sudo apt update

# Install additional required libraries
sudo apt install libasound2 -y
sudo apt install xvfb -y
sudo apt update
sudo apt install -y xvfb


# Set DISPLAY environment variable
export DISPLAY=:0

# Start Openledger Node with specific options
xvfb-run openledger-node --no-sandbox --disable-gpu

