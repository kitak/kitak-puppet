class growthforecast (
  $group                = 'growthforecast',
  $user                 = 'growthforecast',
  $perl_version         = '5.18.1',
) {

  include growthforecast::install
  include growthforecast::package
  include growthforecast::perl

     Class['growthforecast::install']
  -> Class['growthforecast::package']
  -> Class['growthforecast::perl']

}
