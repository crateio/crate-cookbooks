name "base"
description "Base recipes for all nodes"
run_list [
  "recipe[chef-client::cron]",
  "recipe[chef-client::delete_validation]",
  "recipe[git]",
  "recipe[motd-tail]",
  "recipe[openssh]",
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
  :openssh => {
    :server => {
      :print_motd => "no",
      :password_authentication => "no",
      :permit_root_login => "no",
      :pubkey_authentication => "yes",
    },
  },
  :user => {
    :ssh_keygen => false,
  },
  :users => ["dstufft"],
})
