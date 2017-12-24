# Configure a scrape_config for Prometheus
#
define prometheus::scrape_config (
  $job_name = $name,
  $metrics_path = undef,
  $params = {},
  $static_configs,
) {

  concat::fragment { ''}

}
