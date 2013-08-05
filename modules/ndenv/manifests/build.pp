class ndenv::build() {
  exec { "install nodejs ${ndenv::use_version}":
    user        => 'ci',
    environment => ['NDENV_ROOT="/home/ci/ndenv"'],
    path        => ['/bin', '/usr/bin', '/home/ci/ndenv/plugins/node-build/bin'],
    command     => "node-build ${ndenv::use_version} /home/ci/ndenv/versions/${ndenv::use_version}",
    unless      => "test -d /home/ci/ndenv/versions/${ndenv::use_version}",
    timeout     => 0,
  }

  exec { "use nodejs ${ndenv::use_version}":
    user =>  'ci',
    path => ['/usr/bin', '/bin'],
    command => "echo '${ndenv::use_version}' > /home/ci/ndenv/version",
    unless  => "test `cat /usr/local/ndenv/version` == '${ndenv::use_version}'",
  }
}
