VirtualBox Cluster with Vagrant and Hadoop
=====================

Thanks to http://java.dzone.com/articles/setting-hadoop-virtual-cluster for getting me 99% of the way to it all working

Requirements
----------------------------

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- This utilizes the Vagrant 1.1 Api so you need to make sure you are on a [new version of Vagrant](http://downloads.vagrantup.com/tags/v1.2.2)
- [Puppet 3.2.3](https://downloads.puppetlabs.com/mac/puppet-3.2.3.dmg) or greater is needed


Setup
----------------------------

    git clone git@github.com:gizm0duck/vagrant-puppet-hadoop.git
    cd vagrant-puppet-hadoop
    vagrant box add base-hadoop http://files.vagrantup.com/lucid64.box
    vagrant init base-hadoop
    vagrant up
    vagrant provision
    vagrant reload
    
Once everything comes up

    cd /opt/hadoop-1.2.1/bin/
    source ../conf/hadoop-env.sh
    ./hadoop namenode -format 
    ./start-all.sh
    
Go to [http://192.168.1.10:50030](http://192.168.1.10:50030) and bask in your awesomeness
[link text itself]: http://www.reddit.com