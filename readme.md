# Purestead

Use Laravel Homestead, the Vagrant way
- VMware compatibility
- No SSH configuration
- Ports forwarding configuration
- Mutiple named VMs
- No specific PHP CLI
- Works well on Windows

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

3) Edit config.yaml (*don't worry, everythng is commented*).

4) Run your VM.

```
vagrant up
```

5) Connect to SSH.

```
vagrant ssh
```

Feel free to check [Homestead](http://laravel.com/docs/4.2/homestead) and [Vagrant](https://docs.vagrantup.com/v2/cli/index.html) documentations for more informations.
