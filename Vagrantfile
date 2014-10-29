# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define 'app', primary: true do |app|
    app.vm.hostname = "wkhtmltox.desarrollo.unlp.edu.ar"
    app.omnibus.chef_version = :latest
    app.vm.box = "cespi/ubuntu-12.04-upgraded"
    app.vm.box_url = "http://desarrollo.unlp.edu.ar/ubuntu-12.04-upgraded.box"
    app.vm.network :private_network, ip: "10.100.100.2"
    app.berkshelf.enabled = true
    app.vm.provision :chef_solo do |chef|
      chef.run_list = [
        "recipe[apt]",
        "recipe[wkhtmltox]",
      ]
    end
  end
end
