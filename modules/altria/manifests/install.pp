class altria::install {
  file { "/home/ci/setup_altria.sh":
    owner => "ci",
    ensure => present,
    content => template("altria/setup.erb"),
  }

  file { "/home/ci/start_altria.sh":
    owner => "ci",
    ensure => present,
    content => template("altria/start.erb"),
  }

  exec { 'setup altria':
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command     => "sh /home/ci/setup_altria.sh",
    creates     => "/var/www/altria",
    timeout     => 0,
  }
}
