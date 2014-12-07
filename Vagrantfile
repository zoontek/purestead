# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"

# Ensure a minimum Vagrant version
Vagrant.require_version ">= 1.5.0"

# Get files paths
configPath = File.expand_path("../config.yaml", __FILE__)
aliasesPath = File.expand_path("../scripts/aliases", __FILE__)
afterPath = File.expand_path("../scripts/after-provision.sh", __FILE__)

# Parse settings
settings = YAML::load(File.read(configPath))

Vagrant.configure("2") do |config|
  # Configure the box
  config.vm.box = "laravel/homestead"
  config.vm.hostname = settings["hostname"] ||= "homestead"

  # Configure a private network IP
  config.vm.network :private_network, ip: settings["ip"] || "192.168.10.10"

  # Configure VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
    vb.name = settings["hostname"]
    vb.customize ["modifyvm", :id, "--memory", settings["memory"] || "2048"]
    vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] || "1"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end

  # Configure port forwarding to the box
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 443, host: 44300
  config.vm.network "forwarded_port", guest: 3306, host: 33060
  config.vm.network "forwarded_port", guest: 5432, host: 54320

  # Register all of the configured shared folders
  settings["folders"].each do |folder|
    config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] || nil
  end

  # Install all the configured Nginx sites
  settings["sites"].each do |site|
    config.vm.provision "shell" do |s|
      if (site.has_key?("hhvm") && site["hhvm"])
        s.inline = "bash /vagrant/scripts/serve-hhvm.sh $1 $2"
        s.args = [site["map"], site["to"]]
      else
        s.inline = "bash /vagrant/scripts/serve-php.sh $1 $2"
        s.args = [site["map"], site["to"]]
      end
    end
  end

  # Create all of the configured databases
  settings["databases"].each do |db|
    config.vm.provision "shell" do |s|
      s.path = File.expand_path("../scripts/create-database.sh", __FILE__)
      s.args = [db]
    end
  end

  # Configure all of the server environment variables
  if settings.has_key?("variables")
    settings["variables"].each do |var|
      config.vm.provision "shell" do |s|
        s.inline = "echo \"\nenv[$1] = '$2'\" >> /etc/php5/fpm/php-fpm.conf"
        s.args = [var["key"], var["value"]]
      end
    end

    config.vm.provision "shell" do |s|
      s.inline = "service php5-fpm restart"
    end
  end

  # Update Composer On Every Provision
  config.vm.provision "shell" do |s|
    s.inline = "/usr/local/bin/composer self-update"
  end

  # Copy bash aliases file
  if File.exists? aliasesPath then
    config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
  end

  # Execute extra commands
  if File.exists? afterPath then
    config.vm.provision "shell", path: afterPath
  end
end
