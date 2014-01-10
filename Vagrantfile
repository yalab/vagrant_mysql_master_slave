# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"

  config.vm.define :db_master do |vm_config|
    vm_config.vm.network :hostonly, "192.168.50.13"
  end
  config.vm.define :db_slave do |vm_config|
    vm_config.vm.network :hostonly, "192.168.50.14"
  end
end
