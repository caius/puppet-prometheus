# Class: prometheus::config
#
#
class prometheus::config {

  concat { 'prometheus_config':
    path => '/etc/prometheus/prometheus.yml',
    ensure_newline => true,
    notify => Service['prometheus'],
  }

  concat::fragment { 'config':
    target => 'prometheus_config',
    order => 1,
    content => '---
  global:
    scrape_interval: "10s"

  scrape_configs:
    - job_name: "prometheus"
      static_configs:
      - targets:
          - "localhost:9090"
    # - job_name: "pushgateway"
    #   honor_labels: true
    #   static_configs:
    #   - targets:
    #       - "localhost:9091"
    # - job_name: "alertmanager"
    #   static_configs:
    #   - targets:
    #       - "localhost:9093"
    - job_name: "node"
      static_configs:
      - targets:
          - "localhost:9100"
'
  }

}
