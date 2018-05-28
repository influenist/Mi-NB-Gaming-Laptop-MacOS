# Install instructions Mi Notebook Air 12.5 7y30

## Step 1 - Get Access to Mac OS
To create a MacOS usb installer you will first need either a. Access to a Mac or b. A virtual machine running macOS. If you do not have a Mac or borrow then create a virtual machine running macOS using one of the two links below depending on whether you are using Intel or AMD as your CPU/Processor.

[VIRTUAL MACOS: USE MACOS SIERRA ON A VIRTUAL MACHINE WITH VMWARE](https://hackintosher.com/guides/virtual-macos-use-macos-sierra-virtual-machine-vmware/) (Hackintosher)

## Step 2 - Creating the macOS Installer
[How to make a USB flash drive installer for macOS](https://hackintosher.com/guides/make-macos-flash-drive-installer/) (Hackintosher)

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
Restart your computer and spam the FN + F2 keys to enter BIOS as the computer boots.

... to be added
