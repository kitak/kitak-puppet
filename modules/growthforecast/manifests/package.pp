class growthforecast::package {

  exec { "Installing yumgroup `Development Tools`":
    path    => "/usr/bin",
    command => "yum -y groupinstall 'Development Tools'",
    timeout => 0,
  }

  $packages = [
    'pkgconfig',
    'glib2-devel',
    'gettext',
    'libxml2-devel',
    'pango-devel',
    'cairo-devel',
    'mplus-2p-fonts',
  ]

  package { $packages:
    ensure => installed,
  }

     Exec['Installing yumgroup `Development Tools`']
  -> Package[$packages]
}
