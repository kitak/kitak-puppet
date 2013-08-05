class ndenv {
  $use_version = 'v0.10.15'
  include ndenv::install
  include ndenv::build

     Class['ndenv::install']
  -> Class['ndenv::build']
}
