class mysql::install {
  $mysql_packages = [
    'mysql-server',
    'libmysqlclient-dev',
  ]

  exec { 'preinstall mysql':
    path =>  ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => 'apt-get update',
  }

  package { $mysql_packages:
    ensure =>  installed,
    require => Exec['preinstall mysql'],
  }
}
