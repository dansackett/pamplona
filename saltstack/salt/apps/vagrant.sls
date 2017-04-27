# Install Vagrant

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_vagrant:
  pkg.installed:
    - name: vagrant
    - sources:
      - vagrant: https://releases.hashicorp.com/vagrant/1.9.4/vagrant_1.9.4_x86_64.deb

install_vagrant_guest_additions:
  cmd.run:
    - name: vagrant plugin install vagrant-vbguest
    - runas: {{ runas_username }}
    - require:
      - pkg: vagrant
