# Purestead

Use Laravel Homestead, the Vagrant way (multiple named VMs, no specific PHP CLI)
Before everything, you must install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

1) Download the Homestead Vagrant box.

```
vagrant box add laravel/homestead
```

2) Clone this repository.

```
git clone https://github.com/zoontek/purestead.git
cd purestead
```

3) Edit the config.yaml file.

4) Use traditionnal Vagrant commands, like:
```
vagrant up (--provision)
vagrant ssh
vagrant provision
vagrant reload (--provision)
vagrant halt
…
```

## Update homestead scripts

```
sh update.sh
```

Feel free to check [Homestead](http://laravel.com/docs/5.2/homestead) and [Vagrant](https://docs.vagrantup.com/v2/cli/index.html) documentations for more informations.
