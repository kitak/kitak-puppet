define plenv::install (
  $version = $name,
  $user,
) {

  $home = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  $plenv_root = "${home}/.plenv"
  $profile    = "${home}/.bash_profile"

  Exec {
    user        => $user,
    cwd         => $home,
    environment => [ "HOME=${home}" ],
    path        => "${plenv_root}/bin:/bin:/usr/local/bin:/usr/bin",
    timeout     => 0,
  }

  exec { "install plenv for ${user}":
    command => "git clone git://github.com/tokuhirom/plenv.git ${plenv_root}",
    creates => "${plenv_root}",
  }

  exec { "install perl-build for ${user}":
    command => "git clone git://github.com/tokuhirom/Perl-Build.git ${plenv_root}/plugins/perl-build/",
    creates => "${plenv_root}/plugins/perl-build",
  }

  exec { "add plenv setting for ${user}":
    command => "echo '
export PATH=\"\$HOME/.plenv/bin:\$PATH\"
eval \"\$(plenv init -)\"
' >> ${profile}
    ",
    unless  => "grep 'plenv init -' ${profile}",
  }

  exec { "plenv::install ${user} ${version}":
    command => "plenv install ${version}",
    creates => "${plenv_root}/versions/${version}",
  }

  exec { "plenv::global ${user} ${version}":
    command => "plenv global ${version}",
    unless  => "grep '${version}' ${plenv_root}/version",
  }

     Exec["install plenv for ${user}"]
  -> Exec["install perl-build for ${user}"]
  -> Exec["add plenv setting for ${user}"]
  -> Exec["plenv::install ${user} ${version}"]
  -> Exec["plenv::global ${user} ${version}"]

}
