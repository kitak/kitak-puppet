class ci_jstest::install {
  exec { 'install testem':
    user    =>  'ci',
    environment => ['NDENV_ROOT="/home/ci/ndenv"'],
    path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => "/bin/bash -c 'source /home/ci/.bash_profile; npm install -g testem'",
    unless  => 'test -x /home/ci/ndenv/shims/testem',
    timeout => 0,
  }
}
