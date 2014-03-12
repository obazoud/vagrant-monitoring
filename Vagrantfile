# -*- mode: ruby -*-
# vi: set ft=ruby :

# Install berkshelf 3
# https://github.com/berkshelf/berkshelf/wiki/Howto:-Use-the-bleeding-edge
Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"

#Vagrant.require_plugin "vagrant-cachier"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :monitoring_server do |monitoring_server|
    monitoring_server.vm.box = "opscode-ubuntu-13.04"
    monitoring_server.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-13.04_chef-provisionerless.box"

    monitoring_server.vm.hostname = "monitoring-server.vm"

    monitoring_server.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize [
        'modifyvm', :id,
        '--memory', '1024',
        '--cpus', '2'
      ]
    end

    monitoring_server.ssh.forward_agent = true
    monitoring_server.vm.network :private_network, ip: "192.168.33.10", netmask: "255.255.255.0"
    monitoring_server.vm.network :forwarded_port, guest: 80, host: 8080, id: "graphite", auto_correct: false
    monitoring_server.vm.network :forwarded_port, guest: 80, host: 8081, id: "graphitus", auto_correct: false
  
    monitoring_server.omnibus.chef_version = :latest
    monitoring_server.berkshelf.enabled = true

    monitoring_server.vm.provision :chef_solo do |chef|
      chef.log_level = :info
      chef.cookbooks_path = ["site-cookbooks","cookbooks"]
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.provisioning_path = "/tmp/vagrant-chef"

      chef.add_role "monitoring_server"

    end

  end

end
