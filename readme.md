# Purestead

Use Laravel Homestead, the Vagrant way:
- Simple config
- No specific CLI
- Infinite VMs

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

3) Edit config.yaml. You can change the VM name (for infinite VMs), the database username and password.

```yaml
hostname: "homestead"
…
username: "homestead"
password: "secret"
```

4) Run your VM.

```
vagrant up
``` 

5) Connect to SSH.

```
vagrant ssh
``` 

Feel free to check [Homestead](http://laravel.com/docs/4.2/homestead) and [Vagrant](https://docs.vagrantup.com/v2/cli/index.html) documentations for more informations.
