# Minecraft Paper Server Setup

This guide provides instructions for setting up a Minecraft server running on Paper. Follow the steps below to manually configure your server.

> [!WARNING]  
> This repository is currently in development! It uses a root user to start up the server and should not be run on important hardware! Use with caution

---

## Quickstart (Automated Setup)

This quickstart sets up a basic paper minecraft server, [BlueMap](https://bluemap.bluecolored.de/), nginx and certbot for the given domain.

1. Set up a server and log in as the root user.
2. Run the following command, replacing `<your-domain.com>` with your actual domain:

```sh
sudo ./init.sh <your-domain.com>
```

---

## Manual Setup Guide

### 1. Server Creation

Create a virtual server with a minimum configuration that includes at least 2GB of RAM (e.g., CX22 level or equivalent). Ensure you add your SSH key for secure access.

### 2. Domain (Optional)

Using a domain is optional but can make your server easier to access. Point an A-Record for your domain to the IP address of your server.

### 3. Create Minecraft Directory

Create a `minecraft` directory inside the `/root` directory to store all server files. If you prefer a different directory, update all relevant file paths in your configuration and startup scripts accordingly.

   ```sh
   mkdir /root/minecraft
   ```

### 4. Java Installation

Install Java (version 21 or above) using your system's package manager. To check if Java is installed, type `java` in the terminal. If it’s not installed, your package manager should suggest installation options.

   ```sh
   sudo apt install openjdk-21-jre
   ```

### 5. Nginx (Optional)

If you plan to use web-based tools such as [BlueMap](#bluemap), you should install Nginx. To do this you can run the provided `nginx-setup.sh` script as root:

   ```sh
   ./nginx-setup.sh <web-domain.com>
   ```

### 6. Install Paper

Download the Paper `.jar` file from [PaperMC](https://papermc.io/) and place it in the `/root/minecraft` folder. Start the server for the first time using:

   ```sh
   java -jar paper.jar
   ```

### 7. Configure Systemd for Autostart

1. Copy the `start.sh` script into the `/root/minecraft` directory.
2. Place the `start-mc.service` file in the `/etc/systemd/system/` directory, renaming it to `start-minecraft.service`.

   Enable the service to start on boot and test it:

   ```sh
   sudo systemctl enable start-minecraft.service
   sudo systemctl start start-minecraft.service
   ```

   After a reboot, the server should start automatically.

### 8. Whitelist Configuration (Optional)

If you want to restrict server access, place a `whitelist.json` file in the `/root/minecraft` directory. Configure this file with the usernames of the players allowed to join.

### 9. Server Settings

Copy a basic configuration file (`server.properties`) into `/root/minecraft` to set up server properties such as game mode, difficulty, and world settings.

### 10. Plugins (Optional)

#### BlueMap

To install the [BlueMap](https://hangar.papermc.io/Blue/BlueMap) plugin, download the `.jar` file and add it to the `/root/minecraft/plugins` folder. BlueMap provides an interactive map of your Minecraft world, accessible via a web browser. It serves a website on port 8100 on all interfaces by default. You can either access the web page via direct IP and port or use the previously configure nginx to view the map viewer.

--- 

This completes the setup. For additional plugins or advanced server configurations, refer to the official [PaperMC](https://docs.papermc.io/) documentation.