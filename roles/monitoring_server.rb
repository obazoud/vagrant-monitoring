name "monitoring_server"
description "This is a monitoring server role"
run_list(
  "recipe[base]",
  "recipe[monitoring::server]"
)
default_attributes(
  'java' => {
    'jdk_version' => '7',
    'oracle' => {
      'accept_oracle_download_terms' => true
    }
  }
)
