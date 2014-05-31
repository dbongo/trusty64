VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Configure VM with Ubuntu 14.04	
  config.vm.box = "ubuntu/trusty64"

  # Forward port 9000 on host and guest systems
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  # Sync ivy repo from host user's home dir with home dir in VM  
  config.vm.synced_folder "~/.ivy2", "/home/vagrant/.ivy2"

  # Configure VM with 2GB memory
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048"]
     v.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
  end

  # Run provision script to install 3rd party frameworks & dev tools
  config.vm.provision :shell, :path => "provision.sh"
end