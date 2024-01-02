# minecraft-paper-setup

This document contains a setup guide for a minecraft server using hetzners vServers.

# Automated description

## Quickstart

Create a server and run the following command as root

```
sudo ./init.sh <your-domain.com>
```

# Manual description

## Hetzner

Create a vServer at hetzners cloud. At least a CX21. Don't forget to add your SSH key.

## Domain (optional)

Minecraft works by using a IPv4, but a domain is easier to remember. Point a A Record of your domain to the new server.

## Folder

Create folder `minecraft` inside the `/root` folder.
_Note: If you want to use another folder, check the provided files and change each path/username._

## Java

Install Java Version 17 or above by using `apt`. If you have not installed it, type `java` in the terminal and it should
display possible installation options.

## nginx (optional)

For web-based deployments such as [BlueMap](#bluemap) you need nginx. To install it run `nginx-setup.sh` as root with the following parameters:

```sh
./nginx-setup.sh <web-domain.com>
```

## Paper

Install Paper by downloading the `.jar` file from https://papermc.io/ and place it inside the `/root/minecraft` folder.
Type `java -jar paper.jar` to start it once.

## Systemd Autostart Setup

Place the `start.sh` inside the `/root/minecraft` folder.
Place the `start-mc.service` file inside the file `/etc/systemd/system/start-minecraft.service`. After that run
`sudo systemctl enable start-minecraft.service` and then to test it `sudo systemctl start start-minecraft.service`. After a reboot the server should start.

## Whitelist

Put the `whitelist.json` inside `/root/minecraft`.

## Server settings

A basic configuration of the server config file can be copied from `server.properties`. Just replace the current file inside the `/root/minecraft` folder.

## Plugins (optional)

### BlueMap

To download and install [BlueMap](https://hangar.papermc.io/Blue/BlueMap)
