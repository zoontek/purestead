# Purestead

Use Laravel Homestead, the Vagrant way
- VMware compatibility
- No SSH configuration
- Mutiple named VMs
- No specific PHP CLI

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

3) Edit config.yaml.

4) Use traditionnal Vagrant commands, like:
```
vagrant up
vagrant ssh
vagrant provision
vagrant reload (--provision)
vagrant halt
...
```

## Also available (inside the VM)

Add additional sites
```
serve-php domain.app /home/vagrant/project/path/to/public/directory
```
```
serve-hhvm domain.app /home/vagrant/project/path/to/public/directory
```

Create databases
```
create-database name
```

Feel free to check [Homestead](http://laravel.com/docs/4.2/homestead) and [Vagrant](https://docs.vagrantup.com/v2/cli/index.html) documentations for more informations.
