include hadoop

Exec { 
  path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
  timeout => "1000" 
}

group { "puppet":
  ensure => "present",
}

exec { 'apt-get update':
  command => 'apt-get update'
}

exec { 'setup opt':
  command => 'sudo chown -R vagrant /opt'
}

package { "openjdk-6-jdk" :
  ensure => present,
  require => Exec['apt-get update']
} 

file {
  "/home/vagrant/.ssh/id_rsa":
  source => "puppet:///modules/hadoop/id_rsa",
  mode => 600,
  owner => vagrant,
  group => vagrant,
  require => Exec['apt-get update']
 }
 
file {
  "/home/vagrant/.ssh/id_rsa.pub":
  source => "puppet:///modules/hadoop/id_rsa.pub",
  mode => 644,
  owner => vagrant,
  group => vagrant,
  require => Exec['apt-get update']
 }

ssh_authorized_key { "ssh_key":
    ensure => "present",
    key    => "AAAAB3NzaC1yc2EAAAABIwAAAQEA6pz5JMgaEs516h1pJSJ903MU4nbd86j/+bVWSA0StP9Fw1qcJIw4TK4AUTG/A1A4359zmFnbSm3dlWU7EBe4YKFMWHAPegpfq7VpLKwh+jJrfdgOSLAmTrLDO1cq736g1vousmXnc4UL7xxzSvGlqGKXGik9LGy+feDEXQGepD9/wyl5KxpsdLfROqs8G2XaCgBzJky25UwRqsH89/DpO+tG6jqZiPqp337zqPgvBgrteq4KcaFWkWZYZES9CbFKE6dco4UQEXVr1NmzmZMk51urOAIXK2brKVXtQyLyEl+OIvWWdBoW/xuG7s51m8M9k56Zg7Tft9rJ+6kgT9lFXw==",
    type   => "ssh-rsa",
    user   => "vagrant",
    require => File['/home/vagrant/.ssh/id_rsa.pub']
}