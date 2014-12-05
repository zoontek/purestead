require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

configYamlPath = File.expand_path("./config.yaml")
afterScriptPath = File.expand_path("./vagrant/after.sh")

require_relative 'scripts/homestead.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	Purestead.configure(config, YAML::load(File.read(configYamlPath)))

	if File.exists? afterScriptPath then
		config.vm.provision "shell", path: afterScriptPath
	end
end
