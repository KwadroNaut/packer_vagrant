#!/bin/bash

# see https://docs.vagrantup.com/v2/boxes/base.html

# Vagrant specific
date > /etc/vagrant_box_build_time

# Installing vagrant key for root
mkdir -pm 700 /root/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys

# Installing vagrant key for vagrant user
cp -a /root/.ssh/ /home/vagrant/
chown -R vagrant:vagrant /home/vagrant/.ssh

# configure password-less sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers


# Customize the message of the day
echo 'Development Environment' > /etc/motd
