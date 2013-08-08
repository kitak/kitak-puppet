class rbenv::install() {
  $packages = [
    'build-essential',
    'bison',
    'libreadline6-dev',
    #'curl',
    'git-core',
    'zlib1g-dev',
    'libssl-dev',
    'libyaml-dev',
    'libsqlite3-dev',
    'libxml2-dev',
    'libxslt1-dev',
    'autoconf',
    'libncurses5-dev',
  ]

  package { $packages:
    ensure => installed,
  }

  file { "/home/ci/install_rbenv.sh":
    owner    => "ci",
    ensure  => present,
    content =>  template("rbenv/install_${operatingsystem}.erb"),
  }
  
  exec { 'rbenv':
    user => 'ci',
    path => ['/bin', '/usr/bin'],
    command => "sh /home/ci/install_rbenv.sh",
    creates => "/home/ci/rbenv",
    require => File["/home/ci/install_rbenv.sh"],
  }
}
