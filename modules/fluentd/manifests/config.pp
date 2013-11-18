class fluentd::config {

  file {'/etc/td-agent/td-agent.conf':
    content => template("fluentd/etc/td-agent/td-agent.conf"),
  }

  file { '/etc/td-agent/prelink.conf.d':
    ensure => directory,
  }

  file { '/etc/td-agent/prelink.conf.d/td-agent.conf':
    content => template('fluentd/etc/td-agent/prelink.conf.d/td-agent.conf'),
    require => File['/etc/td-agent/prelink.conf.d'],
  }

}
