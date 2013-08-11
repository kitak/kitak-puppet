class browser::service {
  exec {'xvfb enable':
    path        => ['/usr/bin', '/usr/sbin'],
    command     => "update-rc.d xvfb defaults",
    onlyif      => "test -f /etc/init.d/xvfb",
  }

  exec {'xvfb start':
    path        => ['/usr/bin', '/usr/sbin'],
    command     => "/etc/init.d/xvfb start",
  }
}
