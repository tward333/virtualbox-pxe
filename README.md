This repo tracks my efforts to troubleshoot and explore bootstrapping bare-metal via PXE using virtualbox, and easydcim.  The ultimate goal is to gain a better understanding of these mechanisms in a safe environment, and to iterate much faster on ideas using VMs instead of bare metal. 

Covered OS flavors:
Ubuntu 18.04
Ubuntu 20.04
Centos 7

Structure is broken down into these components:
edcim templates - full templates or other modifications required to bootstrap the kernel, load the OS, and feed-in the desired install configuration 
OS templates - configuration files and other materials to define the installer configurations. This includes kickstart, preseed, and cloud-init where relevant. 

Each combination will have bios and UEFI variants, since migrating to UEFI was the primary objective for the private project this was connected to. 

Extras:
docker-compose definition for tftp+dhcp to PXE boot from 
[netboot.xyz](https://github.com/netbootxyz/netboot.xyz) for browsable PXE menus
