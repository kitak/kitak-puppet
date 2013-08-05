class ndenv::install() {
  $packages = [
    'python',
    'g++',
    'make',
    'checkinstall',
    'git',
    'curl',
  ]

  package { $packages:
    ensure => installed,
  }

  file { "/home/ci/install_ndenv.sh":
    owner    => "ci",
    ensure  => present,
    content =>  template("ndenv/install_${operatingsystem}.erb"),
  }
  
  exec { 'ndenv':
    user => 'ci',
    path => ['/bin', '/usr/bin'],
    command => "sh /home/ci/install_ndenv.sh",
    creates => "/home/ci/ndenv",
    require => File["/home/ci/install_ndenv.sh"],
  }
}
