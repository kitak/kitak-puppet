class browser {
  include browser::install
  include browser::config
  include browser::service

     Class['browser::install']
  -> Class['browser::config']
  -> Class['browser::service']
}
