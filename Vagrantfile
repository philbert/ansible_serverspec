# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"

    config.vm.network :private_network, ip: "10.10.10.20"
    config.vm.provider "virtualbox" do |vb|
        # Customize the amount of memory on the VM:
        vb.memory = "1024"
        vb.cpus = "2"

    end
    config.vm.provision 'ansible' do |ansible|
        # If we're using vagrant then we are using
        # a static inventory
        ansible.inventory_path = "inventory/development"
        ansible.raw_ssh_args = ['-o ServerAliveInterval=10', '-o ServerAliveCountMax=10']

        ansible.playbook = 'site.yml'
        ansible.host_key_checking = false
    end
end
