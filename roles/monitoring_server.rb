name "monitoring_server"
"description": "This is a monitoring server role",
run_list(
  "recipe[monitoring::server]"
)