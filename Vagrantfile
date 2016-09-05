# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

configYamlPath = File.expand_path(File.dirname(__FILE__) + '/config.yaml')
configJsonPath = File.expand_path(File.dirname(__FILE__) + '/config.json')
afterScriptPath = File.expand_path(File.dirname(__FILE__) + '/after.sh')
aliasesPath = File.expand_path(File.dirname(__FILE__) + '/aliases')

require File.expand_path(File.dirname(__FILE__) + '/scripts/homestead.rb')

Vagrant.require_version '>= 1.8.4'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if File.exist? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
    end

    if File.exist? configYamlPath then
        settings = YAML::load(File.read(configYamlPath))
    elsif File.exist? configJsonPath then
        settings = JSON.parse(File.read(configJsonPath))
    end

    Homestead.configure(config, settings)

    if File.exist? afterScriptPath then
        config.vm.provision "shell", path: afterScriptPath, privileged: false
    end

    if defined? VagrantPlugins::HostsUpdater
        config.hostsupdater.aliases = settings['sites'].map { |site| site['map'] }
    end
end
