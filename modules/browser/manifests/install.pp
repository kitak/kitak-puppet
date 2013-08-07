class browser::install {
  exec { 'install Xvfb':
    path => ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => "apt-get -y install xvfb",
    unless => "which Xvfb",
  }
  exec { 'install firefox':
    path => ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => "apt-get -y install firefox",
    unless => "which firefox",
  }
  exec { 'setup for chrome install':
    path =>  ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -; sh -c \'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list\'; apt-get update',
    unless => "apt-cache search chrome | grep ^google-chrome-stable",
  }
  exec { 'install chrome':
    path => ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => "apt-get -y install google-chrome-stable",
    unless => "which google-chrome",
    require => Exec['setup for chrome install'],
  }
}
