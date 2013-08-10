class browser::config {
  file { "/etc/init.d/xvfb":
    mode    => "0755",
    ensure  => present,
    content => template("browser/etc/init.d/xvfb"),
  }
}
