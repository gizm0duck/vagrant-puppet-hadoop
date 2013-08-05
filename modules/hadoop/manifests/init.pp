class hadoop {
  $hadoop_version = "1.2.1"
  $hadoop_home = "/opt/hadoop-${hadoop_version}"
  $hadoop_conf = "${hadoop_home}/conf/"

  exec { "download_hadoop":
    command => "wget -O /tmp/hadoop.tar.gz http://mirror.cogentco.com/pub/apache/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz",
    unless => "ls /opt | grep hadoop-${hadoop_version}",
    timeout => "1000",
    require => Package["openjdk-6-jdk"]
  }

  exec { "unpack_hadoop" :
    command => "tar -zxf /tmp/hadoop.tar.gz -C /opt",
    creates => "${hadoop_home}",
    unless => "ls /opt | grep hadoop-${hadoop_version}",
    require => Exec["download_hadoop"]
  }
  
  file {
    "${hadoop_conf}/slaves":
    source => "puppet:///modules/hadoop/slaves",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file {
    "${hadoop_conf}/masters":
    source => "puppet:///modules/hadoop/masters",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
  
  file {
    "${hadoop_conf}/core-site.xml":
    source => "puppet:///modules/hadoop/core-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file {
    "${hadoop_conf}/mapred-site.xml":
    source => "puppet:///modules/hadoop/mapred-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file {
    "${hadoop_conf}/hdfs-site.xml":
    source => "puppet:///modules/hadoop/hdfs-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file {
    "${hadoop_conf}/hadoop-env.sh":
    source => "puppet:///modules/hadoop/hadoop-env.sh",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
}
