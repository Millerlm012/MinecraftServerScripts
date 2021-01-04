#!/bin/bash
# healthy_reboot.sh will reboot the minecraft server every wednesday at 04:00


echo "Performing healthy_reboot.sh!"

# navigating to minecraft directory
cd /media/930drive/minecraftdir

# stopping minecraft server
screen -S minecraftServer -p 0 -X stuff "/stop^M"
echo "The minecraft server has been stopped..."

sleep 60

# killing minecraftServer screen
screen -X -S minecraftServer kill
echo "The minecraftServer screen has been killed..."

sleep 60

# creating new screen and initializing the minecraft server
sudo screen -dmS "minecraftServer" java -Xmx2048M -Xms2048M -jar minecraft_server.jar nogui
echo "The server should be back operational!"
