class redis {
  include redis::install
  include redis::service

     Class['redis::install']
  -> Class['redis::service']
}
