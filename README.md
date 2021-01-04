# MinecraftServerScripts
All scripts being used to ensure my personally hosted Minecraft server is operational.

This Minecraft server is running on an Ubuntu Server I personally set up. There will be a description of what the scripts basic functions are...
- boot.sh -> creates a new detached terminal screen and start the server within it
- (scrips below are ran based on a crontab | crash_reboot.sh is running every 5 minutes | healthy_reboot.sh runs every Wednesday morning)
- crash_reboot.sh -> scans the "crash-reports" folder and if it detects a crash log -> moves the log to the "reboot-crash-reports" and reboots the server in the detached terminal screen
- healthy_reboot.sh -> safely reboot the minecraft server at 04:00 am on Wednesday 
