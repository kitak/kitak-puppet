class altria {
  include mysql
  include redis
  include rbenv
  include altria::install

     Class['rbenv::build']
  -> Class['mysql::service']
  -> Class['redis::service']
  -> Class['altria::install']
}
