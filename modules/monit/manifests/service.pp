class monit::service {

  package { "monit":
    ensure  => running,
    enabled => true,
  }

}
