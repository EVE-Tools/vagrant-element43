Vagrant for element43
=====================

This repository contains the configuration of our unified virtual development environment for element43. This has been tested on Windows 8.1 and Mac OS 10.9.2.

*THIS VM IS DESIGNED FOR DEVELOPMENT USE ONLY - DO NOT MAKE IT ACCESSIBLE FROM THE INTERNET!*

Installation Instructions
-------------------------

Windows users must install the [GitHub Client for Windows](https://windows.github.com) first. Use the Git Shell for executing the commands listed below!

1. Download this repository - click `Download ZIP` in the sidebar of this website and extract it somewhere (or simply `git clone` it)
2. Get [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and install it
3. Get and install [Vagrant](http://www.vagrantup.com/downloads.html) - restart your system, if asked
4. Run `vagrant plugin install vagrant-vbguest` from command line. It will keep the VirtualBox guest additions on your VM up-to-date.
5. In command line navigate to where you have extracted this repository and run `vagrant up` to download and run a basic Ubuntu 14.04 LTS VM
6. Run `vagrant ssh` and then execute `sudo sh /provisioning/bootstrap.sh` - this will install the full Element43 stack in your VM
7. Lean back and watch the magic happen - this might take up to a couple of hours
8. ...
9. Profit!

You'll be able to access your very own instance of element43 under http://127.0.0.1:8080! Remember to stop `node-43`via `supervisord` if you experience high CPU usage! Relevant logfiles are located at `/var/log/element43`. You can stop your VM with `vagrant halt` on your host system. Simply run `vagrant up` from within the vagrant-element43 directory to turn it on again.


Simple File Access
------------------

The VM automatically creates a SMB share you can access via `smb://10.0.13.37` or `\\10.0.13.37` under Windows. Changes to `node-43` and `celery` tasks require restarting the corresponding process via `supervisord` (see below).

Managing Services
-----------------

All relevant services are managed by supervisord:

1. Run `vagrant ssh`
2. Run `sudo supervisorctl`

*Note: It is recommended to stop the `element43:node-43` process after the first couple of hours. However, it will automatically restart once the VM is rebooted!*

Updating your VM
----------------

Run `sudo ansible-playbook /provisioning/vagrant.yml -i /home/vagrant/hosts --connection=local` via SSH. This will update your VM and local repositories.

Using your own repository
-------------------------
If you want to work on a fork of element43, edit the `e43_repository` line in `provisioning/group_vars/vagrant` and fill in your own repo's URL.

Resetting your VM
-----------------

1. Run `vagrant destroy`
2. Repeat steps 5 to 7

Quick Reference
---------------

* OS: Ubuntu Server 14.04 LTS
* RAM: 2048MB (adjust `Vagrantfile`)
* Private Network IP: `10.0.13.37`
* Port Forwarding: `guest:80` -> `host:8080`
* Remote File Access: SMB or SFTP
* Timezone: UTC
* Shell: ZSH / oh-my-zsh
* System/Postgres
    * User: `element43`
    * Password: `element43`
* Postgres Admin
	* Connection from host machine: `tcp://postgres:postgres@10.0.13.37:5432/element43`
    * User: `postgres`
    * Password: `postgres`
* Default EMDR-Network Relay: `tcp://relay-eu-germany-1.eve-emdr.com:8050
* Service Management: `supervisorctl`
* Log File Location: `/var/log/element43`

Recommended Host Hardware Specifications
----------------------------------------

* 2.0+ GHz Multi-Core Processor
* At least 4GB RAM
* 30 GB unused disk space
