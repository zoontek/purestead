require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

configYamlPath = "./config.yaml"
configJsonPath = "./config.json"
afterScriptPath = "./after.sh"
aliasesPath = "./aliases"

require File.expand_path(File.dirname(__FILE__) + '/scripts/homestead.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if File.exists? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
    end

    if File.exists? configYamlPath then
        settings = YAML::load(File.read(configYamlPath))
    elsif File.exists? configJsonPath then
        settings = JSON.parse(File.read(configJsonPath))
    end

    Homestead.configure(config, settings)

    if File.exists? afterScriptPath then
        config.vm.provision "shell", path: afterScriptPath
    end

    if defined? VagrantPlugins::HostsUpdater
        config.hostsupdater.aliases = settings['sites'].map { |site| site['map'] }
    end
end
