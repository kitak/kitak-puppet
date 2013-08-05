class js_testrunner::install {
  exec { 'install testem':
    user    =>  'ci',
    path    => ['/bin', '/usr/bin'],
    command => "sh -c 'npm install -g testem'",
    unless  => 'which testem',
  }
}
