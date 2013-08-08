class redis::service {
  service { 'redis-server':
    enable     =>  false,
    ensure     => stopped,
    hasrestart => false,
  }
}
