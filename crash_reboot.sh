#!/bin/bash
# this script will auto-reboot the minecraft server if it finds a crash report
# checks the crash log for any reports - if it finds a report it will reboot the server and move the crash to reboot-script-dir



# navigating to crash-reports dir
cd /media/930drive/minecraftdir/crash-reports

# if a .txt file is present in the directory:
# - move crash log to reboot-crash-reports
# - kill minecraft screen
# - reboot server
if ls ./*.txt > /dev/null
then
        echo "A crash log has been found! Moving log and rebooting server!"
        mv /media/930drive/minecraftdir/crash-reports/*.txt /media/930drive/minecraftdir/crash-reports/reboot-crash-reports

        # killing minecraft server screen
        echo "Killing minecraftServer screen..."
        cd /media/930drive/minecraftdir
        screen -X -S minecraftServer killscreen -X -S minecraftServer kill

        sleep 60

        # creating new screen and initializing the minecraft server
        echo "Rebooting minecraft server on new screen..."
        sudo screen -dmS "minecraftServer" java -Xmx2048M -Xms2048M -jar minecraft_server.jar nogui
        echo "Everything should be back to operational!"
fi
