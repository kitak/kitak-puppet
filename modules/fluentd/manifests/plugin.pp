define fluentd::plugin (
  $ensure = 'present',
) {

  include ::fluentd

  package { $name:
    provider => fluentgem,
    ensure   => $ensure,
    notify   => Class['fluentd::service'],
  }

}
