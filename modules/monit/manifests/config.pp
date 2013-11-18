class monit::config {

  file { '/etc/monit.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('monit/monit.conf'),
  }

}
