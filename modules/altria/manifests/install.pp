class altria::install {

  exec { "clone altria":
    path => ["/usr/bin", "/bin"],
    command => 'mkdir -p /var/www/altria; cd /var/www/altria; git clone https://github.com/r7kamura/altria.git current; chown -R ci:ci /var/www/altria',
    creates => "/var/www/altria",
  }

  file { '/var/www/altria/current/Gemfile.local':
    owner => "ci",
    ensure => present,
    content => template("altria/Gemfile.local"),
    require => Exec['clone altria'],
  }

  file { "/home/ci/start_altria.sh":
    owner => "ci",
    ensure => present,
    content => template("altria/start.erb"),
  }

  exec { 'setup altria':
    path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    environment => ['RBENV_ROOT="/home/ci/rbenv"'],
    user        => "ci",
    command     => "/bin/bash -c 'source /home/ci/.bash_profile; cd /var/www/altria/current; ./bin/altria setup;'",
    timeout     => 0,
    require     => [File['/var/www/altria/current/Gemfile.local']],
  }
}
