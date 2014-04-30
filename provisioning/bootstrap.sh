#!/usr/bin/env bash
#
# Bootstrap the vagrant VM by installing Ansible and
# letting ansible do the provisioning in local connection mode
#
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:rquillo/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo apt-get autoremove -y
cp /provisioning/vagrant /home/vagrant/hosts
chmod 666 /home/vagrant/hosts
sudo ansible-playbook /provisioning/vagrant.yml -i /home/vagrant/hosts --connection=local 
sudo ansible-playbook /provisioning/roles/e43-web/tasks/initapp.yml -i /home/vagrant/hosts --connection=local --extra-vars "e43_django_settings_module=element43.settings.local"