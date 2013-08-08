class rbenv::build() {
  exec { "install ruby ${rbenv::use_version}":
    user        => 'ci',
    environment => ['RBENV_ROOT="/home/ci/rbenv"'],
    path        => ['/bin', '/usr/bin', '/home/ci/rbenv/plugins/ruby-build/bin'],
    command     => "ruby-build ${rbenv::use_version} /home/ci/rbenv/versions/${rbenv::use_version}; /bin/bash -c 'source ~/.bash_profile; rbenv rehash'",
    unless      => "test -d /home/ci/rbenv/versions/${rbenv::use_version}",
    timeout     => 0,
  }

  exec { "use ruby ${rbenv::use_version}":
    user =>  'ci',
    path => ['/usr/bin', '/bin'],
    command => "echo '${rbenv::use_version}' > /home/ci/rbenv/version",
    unless  => "test `cat /usr/local/rbenv/version` == '${rbenv::use_version}'",
  }

  exec { "install bundler":
    user        => 'ci',
    environment => ['RBENV_ROOT="/home/ci/rbenv"'],
    path        => ['/bin', '/usr/bin'],
    command     => "/bin/bash -c 'source ~/.bash_profile; gem install bundler --no-ri --no-rdoc; rbenv rehash'",
    unless      => "test -x /home/ci/rbenv/shims/bundle",
    timeout     => 0,
    require     => Exec["use ruby ${rbenv::use_version}"],
  }

  exec { "install rails":
    user        => 'ci',
    environment => ['RBENV_ROOT="/home/ci/rbenv"'],
    path        => ['/bin', '/usr/bin'],
    command     => "/bin/bash -c 'source ~/.bash_profile; gem install rails --no-ri --no-rdoc; rbenv rehash'",
    unless      => "test -x /home/ci/rbenv/shims/rails",
    timeout     => 0,
    require     => Exec["install bundler"],
  }

}
