name "base"
description "Base recipes for all nodes"
run_list [
  "recipe[chef-client::cron]",
  "recipe[chef-client::delete_validation]",
]
override_attributes({
  :chef_client => {
    :init_style => "none",
    :cron => {
      :minute => "*/30",
      :hour => "*",
    }
  },
})
