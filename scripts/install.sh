#!/bin/bash
#
# 
# Description: Installs a Oracle Linux Cloud Native Developer VM
# 
#
echo 'Installing and configuring Docker Engine'

# install Docker engine
yum -y install docker-engine


echo 'Installing and configuring Gnome'
# Install Gnome 
yum -y install @gnome-desktop @x11 firefox


echo 'Installing and configuring Eclipse IDE'
# install SCL repo
yum -y install oracle-softwarecollection-release-el7.x86_64
yum-config-manager --enable software_collections

#install Eclipse

yum -y install devtoolset-6.x86_64 rh-eclipse46.x86_64 rh-eclipse46-docker-client  rh-eclipse46-eclipse-cdt-docker rh-eclipse46-eclipse-linuxtools-docker

# Format a second disk as  Btrfs volume
# Configure Btrfs storage driver for Docker engine

docker-storage-config -s btrfs -d /dev/sdb

# Start and enable Docker engine
systemctl start docker
systemctl enable docker

# Add vagrant user to docker group
usermod -a -G docker vagrant
#install kubectl

echo 'Installing Kubectl'
yum install kubectl -y 

#setting password for  Vagrant user
echo "Welcome1" | passwd --stdin vagrant
#Enable X11 

systemctl set-default graphical.target

reboot

echo 'OLCNE Developer VM  is ready to use'
echo 'To get started, on your VirtualBox Manager :'
echo '  Double click on OLCNE_DEV, then loggin as vagran user password Welcome1'
