class ci_jstest::users {
  group { 'ci':
    gid    => 1002,
    ensure =>  present,
  }

  user { 'ci':
    ensure     =>  present,
    uid        => 1002,
    gid        => 1002,
    home       => '/home/ci',
    managehome => true,
    shell      => '/bin/bash',
    require    => Group['ci'],
  }
}
