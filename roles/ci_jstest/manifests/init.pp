class ci_jstest {

  include ::ndenv
  include ci_jstest::users
  include ci_jstest::install

     Class['ci_jstest::users']
  -> Class["::ndenv::install"]
  -> Class["ci_jstest::install"]
}