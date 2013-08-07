class redis::service {
  service { 'redis-server':
    enable     =>  true,
    ensure     => running,
    hasrestart => true,
  }
}
