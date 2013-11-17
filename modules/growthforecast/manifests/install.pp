class growthforecast::install {

  group { $::growthforecast::group:
    ensure => present,
  }

  user { $::growthforecast::user:
    ensure     => present,
    gid        => $::growthforecast::group,
    managehome => true,
    require    => Group[$::growthforecast::group],
  }

  file { "/home/${::growthforecast::user}":
    mode    => 744,
    owner   => $::growthforecast::user,
    group   => $::growthforecast::group,
    require => User[$::growthforecast::user],
  }

}
