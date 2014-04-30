# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  # Ubutu Server 14.04 64-Bit
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Hostname and network config
  config.vm.hostname = "vagrant43"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network "private_network", ip: "10.0.13.37"

  # VirtualBox specific settings
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--uart1", "0x3F8", 4]
  end

  config.vm.synced_folder "provisioning", "/provisioning"

end