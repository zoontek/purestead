# Purestead

Use Laravel Homestead, the Vagrant way: simple config, no specific CLI, infinite VMs.

Before everything, you must install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

1) Download the Vagrant box.

```
vagrant box add laravel/homestead
```

2) Clone this repository.

```
git clone https://github.com/zoontek/purestead.git
cd purestead
```

3) Edit config.yml. You can change the VM name (infinite VMs, yeah!)

```yaml
hostname: "homestead"
…
```

4) Gentleman, start your engine.

```
vagrant up
``` 

Feel free to check [Homestead](http://laravel.com/docs/4.2/homestead) and [Vagrant](https://docs.vagrantup.com/v2/cli/index.html) documentations for more informations.
