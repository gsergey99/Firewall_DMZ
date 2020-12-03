# -*- mode: ruby -*-
# vi: set ft=ruby :

def external_iface()
  return `ip route | awk '/^default via/ {printf "%s", $5}'`
end


Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-stretch64"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 4096
  end

  config.vm.define "router" do |node|
    node.vm.hostname = "router"

    node.vm.network "public_network", bridge: external_iface(), use_dhcp_assigned_default_route: true
    node.vm.network "private_network", ip: "10.0.0.1",    virtualbox__intnet: "dmz"
    node.vm.network "private_network", ip: "192.168.0.1", virtualbox__intnet: "mz"

    node.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook-router.yml"
    end

  end

  config.vm.define "web-server" do |node|
    node.vm.hostname = "web-server"
    node.vm.network "private_network", ip: "10.0.0.2", virtualbox__intnet: "dmz"

    node.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook-server.yml"
    end
  end

  config.vm.define "pc1" do |node|
    node.vm.hostname = "pc1"
    node.vm.network "private_network", type: "dhcp", virtualbox__intnet: "mz"
    node.vm.provision "shell", inline: "ip route del default || true; ip route add default via 192.168.0.1"
  end

end
