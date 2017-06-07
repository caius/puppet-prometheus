# Class: prometheus
#
#
class prometheus {

  include prometheus::install, prometheus::config, prometheus::service

  Class['prometheus::install'] ~> Class['prometheus::config'] ~> Class['prometheus::service']

}
