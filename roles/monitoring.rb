name "monitoring"
description "runs the monitoring services"
run_list [
  "recipe[monitor::master]",
  "recipe[monitor]",
]
override_attributes({
  :rabbitmq => {
    :cluster => false,
  },
  :sensu => {
    :use_ssl => false,
  },
})
