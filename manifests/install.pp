# Class: prometheus::install
#
#
class prometheus::install {

  apt::source { 'debian_robustperception':
    comment  => 'Prometheus packages for Debian',
    location => 'http://deb.robustperception.io/',
    release  => 'precise',
    repos    => 'nightly',
  }

  apt::key { 'debian_robustperception':
    id     => '9DE3830F1185279044D02558972614FA41EFC99D',
    source => 'https://s3-eu-west-1.amazonaws.com/deb.robustperception.io/41EFC99D.gpg',
  }

  Apt::Key <| |> -> Apt::Source <| |>
  Apt::Source <| |> ~> Package <| |>

  $prometheus_packages = [
    'prometheus',
    'node-exporter',
    # 'alertmanager',
    # 'pushgateway',
  ]
  package { $prometheus_packages: }

}
