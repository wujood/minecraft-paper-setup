#!/bin/bash

minecraft_path="/root/minecraft"

# Create workspace
mkdir $minecraft_path

# Install java
apt-get -y update
apt install -y openjdk-21-jdk openjdk-21-jre

# Install paper
curl https://api.papermc.io/v2/projects/paper/versions/1.21.3/builds/12/downloads/paper-1.21.3-12.jar -o $minecraft_path/paper.jar

# Preaccept eula
echo "eula=true" > $minecraft_path/eula.txt

# Install BlueMap 
curl -L https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v5.4/bluemap-5.4-paper.jar -o $minecraft_path/plugins/bluemap.jar

# Copy default logo
cp server-icon.png $minecraft_path

# Create service for mc server
cp start.sh $minecraft_path
cp start-mc_template.service /etc/systemd/system/start-minecraft.service
sed -i "s#<PATH>#$minecraft_path#" /etc/systemd/system/start-minecraft.service
systemctl enable start-minecraft.service
systemctl start start-minecraft.service
echo "wait for mc server to start..."
sleep 60

# Set server config
cp whitelist.json $minecraft_path
cp server.properties $minecraft_path

# Set up nginx
./nginx-setup.sh $1

echo "done."
#reboot
