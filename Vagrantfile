# -*- mode: ruby -*-
# vi: set ft=ruby :

# Dev/Test Box

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = true
  config.vm.hostname = "www.techstoa.com"

  config.vm.network "private_network", ip: "192.168.121.10"

  config.vm.provider :libvirt do |v|
#   v.host = 'desktop'
#   v.username = 'gboyce'
    v.driver = "kvm"
#   v.connect_via_ssh = true
    v.memory = 1024
    v.cpus = 1
    v.nested = true
  end

  config.vm.synced_folder ".", "/vagrant", create: true, type: "rsync"
  config.ssh.forward_agent = true

#  config.vm.provision :hostsupdate, run: 'always' do |host|
#	host.manage_guest = true
#	host.manage_host = true
#  end

  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", run: "always"
end
