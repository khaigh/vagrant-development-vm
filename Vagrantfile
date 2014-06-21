#Vagrantfile for Dev Environment
#
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "phusion-open-ubuntu-12.04-amd64"
  config.vm.box_url = "http://127.0.0.1:8080/ubuntu-12.04-amd64-vbox.box"

  # configure network
  config.vm.network "private_network", ip: "10.2.0.10", netmask: "255.255.0.0"
  config.vm.network "forwarded_port", guest: 4243, host: 4243

  # configure VM provider
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  # provision
  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?

    local_vm_files = "#{File.dirname(__FILE__)}/.vm_files"
    remote_vm_files = "/vagrant/.vm_files"

    # install docker
    config.vm.provision :shell, :path => "#{local_vm_files}/docker.sh"

    # install dev tools
    config.vm.provision "shell" do |s|
       s.path = "#{local_vm_files}/provision.sh"
       s.args = [remote_vm_files]
    end

    # install user specific dev tools
    config.vm.provision "shell" do |s|
       s.path = "#{local_vm_files}/user_provision.sh"
       s.args = [remote_vm_files, "vagrant", "vagrant"]
       s.privileged = false
    end

  end
end
## End of Vagrantfile
