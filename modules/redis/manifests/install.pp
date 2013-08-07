class redis::install {
  package { 'redis-server':
    ensure =>  installed,
  }
}
