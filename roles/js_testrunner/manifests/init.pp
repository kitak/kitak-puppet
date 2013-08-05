class js_testrunner {

  include ::ndenv
  include js_testrunner::users
  include js_testrunner::install

     Class['js_testrunner::users']
  -> Class["::ndenv::install"]
  -> Class["js_testrunner::install"]
}
