Vagrant.configure("2") do |config|
  config.vm.define "SQL" do |maquinaSQL|
    maquinaSQL.vm.box = "gusztavvargadr/ubuntu-server-2204-lts"
    maquinaSQL.vm.network "forwarded_port", guest: 3306, host: 3307, host_ip: "127.0.0.1"
    maquinaSQL.vm.network "public_network"
    maquinaSQL.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "1"
      vb.name = "SQL"
    end
    maquinaSQL.vm.provision "shell", path: "bootscriptSQL.sh"
  end

  config.vm.define "PHP" do |maquinaPHP|
    maquinaPHP.vm.box = "gusztavvargadr/ubuntu-server-2204-lts"
    maquinaPHP.vm.network "forwarded_port", guest: 80, host: 8081, host_ip: "127.0.0.1"
    maquinaPHP.vm.network "public_network"
    maquinaPHP.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "1"
      vb.name = "PHP"
    end
    maquinaPHP.vm.provision "shell", path: "bootscriptPHP.sh"
  end
end
