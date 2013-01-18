name "base"
description "Base recipes for all nodes"
run_list [
  "recipe[chef-client::cron]",
  "recipe[chef-client::delete_validation]",
  "recipe[sudo]",
  "recipe[user::data_bag]",
  "recipe[zsh]",
]
override_attributes({
  :authorization => {
    :sudo => {
      :groups => ["wheel"],
      :passwordless => true,
    },
  },
  :chef_client => {
    :init_style => "none",
    :cron => {
      :minute => "*/30",
      :hour => "*",
    }
  },
  :user => {
    :ssh_keygen => false,
  },
  :users => ["dstufft"],
})
