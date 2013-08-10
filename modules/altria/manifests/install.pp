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

  file { '/var/www/altria/current/Gemfile.local':
    ensure => present,
    content => template("altria/Gemfile.local"),
  }

  exec { 'setup altria':
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command     => "sh /home/ci/setup_altria.sh",
    creates     => "/var/www/altria",
    timeout     => 0,
    require     => [File['/var/www/altria/current/Gemfile.local'], File['/home/ci/setup_altria.sh']],
  }
}
