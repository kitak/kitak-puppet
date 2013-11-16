class yum_repos {

  yumrepo {'epel':
    name       => "epel",
    descr      => 'epel repo',
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
    enabled    => 1,
    gpgcheck   => 0,
  }

  yumrepo {'nginx':
    name     => 'nginx',
    descr    => 'nginx repo',
    baseurl  => 'http://nginx.org/packages/rhel/6/$basearch/',
    enabled  => 1,
    gpgcheck => 0,
  }

  yumrepo {'treasuredata':
    name     => 'treasuredata',
    descr    => 'treasuredata repo',
    baseurl  => 'http://packages.treasure-data.com/redhat/$basearch/',
    enabled  => 1,
    gpgcheck => 0,
  }

}
