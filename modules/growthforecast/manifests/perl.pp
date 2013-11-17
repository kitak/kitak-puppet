class growthforecast::perl {

  plenv::install {$::growthforecast::perl_version:
    user => $::growthforecast::user,
  }

  plenv::cpanm {'GrowthForecast':
    perl_version => $::growthforecast::perl_version,
    user         => $::growthforecast::user,
    args         => '--force --notest',
  }

     Plenv::Install[$::growthforecast::perl_version]
  -> Plenv::Cpanm['GrowthForecast']
}
