# Purestead

Use Laravel Homestead, the Vagrant way (multiple named VMs, no PHP CLI, no `~/.homestead` folder).

#### System Requirements
- [VirtualBox](https://www.virtualbox.org/) or [VMware](https://www.vmware.com/)
- [Vagrant](https://www.vagrantup.com/)

### 1. Installing The Homestead Vagrant Box

```
vagrant box add laravel/homestead
```

### 2. Installing Purestead

```
git clone https://github.com/zoontek/purestead.git && cd purestead
```

### 3. Configuring Purestead

As Purestead is 100% compatible with Homestead config, take a look at [the official documentation](https://laravel.com/docs/master/homestead) to edit the `config.yaml` file.

### 4. Enjoy using traditionnal Vagrant commands
```
vagrant up --provision
vagrant ssh
vagrant provision
vagrant reload --provision
vagrant halt
…
```

### Bonus: Grab lastest Homestead scripts and aliases

As Purestead scripts and aliases may be outdated since a potentially recent Homestead update, feel free to update them using Homestead ones *(`git` must be installed and accessible)*

```
sh update.sh
```
