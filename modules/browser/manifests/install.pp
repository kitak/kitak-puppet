class browser::install {
  package { 'xvfb':
    ensure => installed,
  }
  package { 'firefox':
    ensure => installed,
  }
  exec { 'setup for chrome install':
    path =>  ['/usr/bin', '/bin'],
    command => 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -; sh -c \'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list\'; apt-get update',
  }

}
