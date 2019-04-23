# 
# Description: Creates an Oracle Linux Cloud Native Developer VM
# 
# 

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# define hostname
NAME = "OLCNE-DEV"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ol7-latest"
  config.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
  config.vm.define NAME
  
  config.vm.box_check_update = false
  
  # change memory size
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.name = NAME
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # VM hostname
  config.vm.hostname = NAME

  # Provision everything on the first run
  config.vm.provision "shell", path: "scripts/install.sh"

  end
