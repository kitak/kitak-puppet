class ci_jstest {

  include ::ndenv
  include ci_jstest::users
  include ci_jstest::install
  include ::browser
  include ::altria

     Class['ci_jstest::users']
  -> Class["::ndenv::build"]
  -> Class["ci_jstest::install"]
}
