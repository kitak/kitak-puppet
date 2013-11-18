class fluentd::service {

  service {'td-agent':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      start      => '/etc/init.d/td-agent start',
      stop       => '/etc/init.d/td-agent stop',
      restart    => '/etc/init.d/td-agent restart',
      status     => 'pgrep -f sbin/td-agent',
  }

}
