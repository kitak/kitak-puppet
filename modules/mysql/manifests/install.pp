class mysql::install {
  $mysql_packages = [
    'mysql-server',
    'libmysqlclient-dev',
  ]

  package { $mysql_packages:
    ensure =>  installed,
  }
}
