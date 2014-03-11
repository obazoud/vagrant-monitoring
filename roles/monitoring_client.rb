name "monitoring_client"
description "This is a monitoring client role"
run_list(
  "recipe[base]",
  "recipe[monitoring::client]"
)