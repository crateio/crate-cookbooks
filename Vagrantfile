#!/usr/bin/env ruby

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.berkshelf.berksfile_path = "./Berksfile"

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.host_name = "crate-cookbooks-berkshelf"

  config.vm.box = "Chef"

  config.vm.network :hostonly, "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :authorization => {
        :sudo => {
          :users => ["vagrant"],
        },
      },
    }

    chef.data_bags_path = "data_bags"

    chef.roles_path = "roles"
    chef.add_role "base"
    chef.add_role "monitoring"
  end
end
