#!/bin/bash

minecraft_path="/root/minecraft"

# Create workspace
mkdir $minecraft_path

# Set up nginx
./nginx-setup.sh mc.nerd-labor.de

# Install paper
curl https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/370/downloads/paper-1.20.4-370.jar -o $minecraft_path/paper.jar

# Create service for mc server
cp start.sh $minecraft_path
cp start-mc_template.service /etc/systemd/system/start-minecraft.service
sed -i "s/<PATH>/\\$minecraft_path/" /etc/systemd/system/start-minecraft.service
systemctl enable start-minecraft.service
systemctl start start-minecraft.service

echo "wait for mc server to start..."
sleep 60

cp whitelist.json $minecraft_path
cp server.properties $minecraft_path

echo "done."
#reboot