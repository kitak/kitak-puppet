define plenv::cpanm (
  $module = $name,
  $perl_version,
  $user,
  $args   = '',
) {

  $home = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  $plenv_root = "${home}/.plenv"

  Exec {
    user        => $user,
    cwd         => $home,
    environment => [ "HOME=${home}", "PLENV_VERSION=${perl_version}" ],
    path        => "${plenv_root}/bin:${plenv_root}/shims:/bin:/usr/bin",
    timeout     => 0,
  }

  exec { "plenv::install-cpanm ${user} ${perl_version} ${module}":
    command => "plenv install-cpanm && plenv rehash",
    creates => "${plenv_root}/versions/${perl_version}/bin/cpanm",
  }

  exec { "cpanm ${user} ${perl_version} ${module}":
    command => "cpanm $args ${module} && plenv rehash",
    unless  => "${plenv_root}/versions/${perl_version}/bin/perl -M${module}"
  }

     Exec["plenv::install-cpanm ${user} ${perl_version} ${module}"]
  -> Exec["cpanm ${user} ${perl_version} ${module}"]

}
