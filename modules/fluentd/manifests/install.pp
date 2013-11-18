class fluentd::install {

  package {'td-agent':
    ensure => latest,
  }

  file {'/etc/td-agent/conf.d':
    ensure  => directory,
    require => Package['td-agent'],
  }

}
