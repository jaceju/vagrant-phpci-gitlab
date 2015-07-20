# PHPCI/Gitlab VM by Vagrant

## Install

1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) first, and build base box from [jaceju/vagrant-phpci](https://github.com/jaceju/vagrant-phpci).

2. Clone the repository:

 ```bash
 git clone https://github.com/jaceju/vagrant-phpci-gitlab.git
 ```

3. Build vm:

 ```
 cd vagrant-phpci-gitlab
 vagrant up
 ```

4. Add IP/hostname mapping to `/etc/hosts` on Host OS:

 ```
 192.168.10.20  gitlab.local
 ```

 And the url will be:

 ```
 http://gitlab.local:10080
 ```

## Gitlab accout

* username: `root`
* password: `5iveL!fe`

## License

MIT
