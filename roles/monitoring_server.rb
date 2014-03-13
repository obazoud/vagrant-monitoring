name "monitoring_server"
description "This is a monitoring server role"
run_list(
  "recipe[base]",
  "recipe[monitoring::server]"
)
default_attributes(
  'python' => {
    'setuptools_version' => '3.1',
    'virtualenv_version' => '1.11.4'
  },
  'graphitus' => {
    'hostname' => 'graphitus'
  }
)
