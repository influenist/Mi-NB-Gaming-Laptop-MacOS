# Install instructions Mi Notebook Air 12.5 7yXX Series

### Supported devices:
- m3 7y30 4 GB
- i5 7y54 4 GB / 8 GB

## Step 1 - Get Access to Mac OS
To create a MacOS usb installer you will first need either access to a Mac which runs macOS. If you do not have one, find a friend who does!

## Step 2 - Creating the macOS Installer
[How to make a USB flash drive installer for macOS](https://hackintosher.com/guides/make-macos-flash-drive-installer/) (Hackintosher) 
Don't have MacOS? Check the readme for creating an [internet installer](https://www.hackintosh-forum.de/lexicon/entry/105-recovery-stick/?synonym=163) (hackintosh-forum.de)

## Step 3 - Add Clover to EFI Boot Partition
1. Download [Clover Configurator](http://mackie100projects.altervista.org/download-clover-configurator/)
1. Open __Clover Configurator__
1. Select __Mount EFI__ under TOOLS
1. Click __Mount Partition__ for Install macOS...
1. Click __Open Partition__ (This is your EFI Folder)
1. __Delete__ the existing EFI folder if it's in the partition
1. __Download__ the latest [release](https://github.com/influenist/Mi-NB-Gaming-Laptop-MacOS/releases) for your Mi NoteBook / Gaming Laptop
1. __Unzip__ the .zip file
1. __Copy & Paste__ the unzipped __EFI__ folder to __mounted partition__ or __/Volumes/EFI__

## Step 4 - BIOS Settings
Plug-in your USB macOS installer, restart your Mi NoteBook and spam the FN + F2 keys to enter BIOS as the NoteBook boots.

Once the bios apears, please adjust the following values
- Security > Set Supervisor Password (REMEMBER THIS!)
- Security > Secure boot > Disable
- Boot > Boot Mode > UEFI
- Boot > Boot Device Order > Select your USB installer (use +/- to change the order and get your USB installer on top)

You are now setup, hit F10 to save your adjustments and boot up the macOS installer.

## Step 5 - Installing macOS

[Mac OS High Sierra Hackintosh Install Clover Walkthrough](http://hackintosher.com/guides/macos-high-sierra-hackintosh-install-clover-walkthrough) (Hackintosher)

## Post install notes
After you have succesfully run through these steps and booted your Hackintosh, you will notice your device has no internal WIFI. This is due to the unsuported INTEL WIFI Bluetooth chip in the NoteBoot Air. In this case either use USB tether (install RDNIS for Android), use an USB WIFI key such as EDIMAX or use your internal M.2 Key M (PCIE) port for the adapter mentioned [here](https://www.hackintosh-forum.de/index.php/Thread/36796-M-2-key-M-to-M-2-key-A-E-for-WIFI-BT-adapter/)  

![macOS High Sierra System overview Mi NoteBook Air 12.5 7y30](https://github.com/influenist/Mi-NB-Gaming-Laptop-MacOS/raw/master/Mi-NB-Air-125-7y30/Mi-NB-HS.png)
