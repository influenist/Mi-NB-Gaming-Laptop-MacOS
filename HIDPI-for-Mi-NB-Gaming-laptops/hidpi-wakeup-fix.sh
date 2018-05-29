#!/bin/bash

sudo curl -fsSL "https://raw.githubusercontent.com/influenist/Mi-NB-Gaming-Laptop-MacOS/master/HIDPI-for-Mi-NB-Gaming-laptop/org.zysuper.ricecracker.daemon.plist" /Library/LaunchAgents
sudo curl -fsSL "https://raw.githubusercontent.com/influenist/Mi-NB-Gaming-Laptop-MacOS/master/HIDPI-for-Mi-NB-Gaming-laptop/riceCrackerDaemon" /usr/bin

sudo chmod 755 /usr/bin/riceCrackerDaemon
sudo chown root:wheel /usr/bin/riceCrackerDaemon

sudo chmod 644 /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist
sudo chown root:wheel /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist

sudo launchctl load /Library/LaunchAgents/org.zysuper.ricecracker.daemon.plist

echo 'Installing HiScale Complete！'
echo 'This is the end of the installation!'
bash read -p 'Press any key to exit'
