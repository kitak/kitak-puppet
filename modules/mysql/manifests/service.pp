class mysql::service {
  service { 'mysql':
    enable     =>  true,
    ensure     => running,
    hasrestart => true,
  }
}
