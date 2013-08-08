class rbenv {
  $use_version = '2.0.0-p247'
  include rbenv::install
  include rbenv::build

     Class['rbenv::install']
  -> Class['rbenv::build']
}
