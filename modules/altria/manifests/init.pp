class altria {
  include mysql
  include redis
  include rbenv
  include altria::install
  include altria::config

     Class['rbenv::build']
  -> Class['mysql::service']
  -> Class['redis::service']
  -> Class['altria::install']
}
