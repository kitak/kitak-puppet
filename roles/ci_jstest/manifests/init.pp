class ci_jstest {

  include ::ndenv
  include ci_jstest::users
  include ci_jstest::install
  include ::browser
  include ::altria

  exec { 'apt-get update':
    path =>  ['/usr/bin', '/bin', '/sbin', '/usr/sbin', '/usr/local/sbin'],
    command => 'apt-get update',
  }
     Class['ci_jstest::users']
  -> Class["::ndenv::build"]
  -> Class["ci_jstest::install"]

     Exec["apt-get update"]
  -> Class["altria::install"]
}
