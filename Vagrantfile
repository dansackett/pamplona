# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define 'desktop' do |desktop|
    desktop.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

    desktop.vm.provider 'virtualbox' do |virtualbox|
      virtualbox.memory = 1024 * 2
      virtualbox.cpus = 2
      virtualbox.customize ['modifyvm', :id, '--vram', '64']
      virtualbox.customize ['modifyvm', :id, '--accelerate3d', 'on']
      virtualbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    end

    # load Ubuntu 16.04 LTS (Xenial Xerus)
    desktop.vm.box = 'ubuntu/xenial64'

    # disable default share
    desktop.vm.synced_folder '.', '/vagrant', disabled: true

    # mimic desktop dir structure
    desktop.vm.synced_folder '.', '/home/vagrant/desktop'

    # bootstrap the environment
    desktop.vm.provision 'bootstrap',
                         type: 'shell',
                         inline: '/bin/sh /home/vagrant/desktop/bin/bootstrap_desktop',
                         privileged: false

    # update the environment
    desktop.vm.provision 'update',
                         type: 'shell',
                         inline: '/bin/sh /home/vagrant/desktop/bin/update_desktop',
                         run: 'always',
                         privileged: false
  end
end
