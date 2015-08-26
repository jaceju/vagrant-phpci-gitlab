# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "vagrant-phpci"

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        # v.gui = true
    end

    config.vm.provision :shell, :path => "./setup.sh"
    config.vm.hostname = "phpci.local"
    # config.vm.network "forwarded_port", guest: 80, host: 80
    # config.vm.network "forwarded_port", guest: 443, host: 443
    # config.vm.network "forwarded_port", guest: 3306, host: 33060
    config.vm.network "private_network", ip: "192.168.10.20"

end
