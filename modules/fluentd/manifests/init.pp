class fluentd {

  include fluentd::install
  include fluentd::config
  include fluentd::service

     Class['fluentd::install']
  -> Class['fluentd::config']
  ~> Class['fluentd::service']
}
