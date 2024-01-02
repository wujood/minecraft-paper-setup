# minecraft-paper-setup

## Folder
Create folder `minecraft` inside the `/root` folder.
 _Note: If you want to use another folder, check the provided files and change each path/username._

## Java
Install Java Version 17 or above by using `apt`. If you have not installed it, type `java` in the terminal and it should
display possible installation options.

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
