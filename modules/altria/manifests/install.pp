class altria::install {
  file { "/home/ci/setup_and_start_altria.sh":
    owner => "ci",
    ensure => present,
    content => template("altria/setup_and_start.erb"),
  }

  exec { 'setup and start altria':
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command     => "sh /home/ci/setup_and_start_altria.sh",
    creates     => "/var/www/altria",
    timeout     => 0,
  }
}
