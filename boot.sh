#!/bin/bash
# boot.sh will create a new screen and initialize the minecraft sever automatically


# navigates to the minecraftdir
cd /media/930drive/minecraftdir

# creates new screen and boots minecraft server on it
sudo screen -dmS "minecraftServer" java -Xmx2048M -Xms2048M -jar minecraft_server.jar nogui
