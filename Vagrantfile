# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define :db_master do |master|
    master.vm.network :private_network, ip: "192.168.1.11"
    master.vm.network :forwarded_port, host: 8001, guest: 8000
  end

  config.vm.define :db_slave  do |slave|
    slave.vm.network :private_network, ip: "192.168.1.12"
    slave.vm.network :forwarded_port, host: 8002, guest: 8000
  end
end
