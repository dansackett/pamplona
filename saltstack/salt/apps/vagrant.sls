# Install Vagrant

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_vagrant:
  pkg.installed:
    - name: vagrant

install_vagrant_guest_additions:
  cmd.run:
    - name: vagrant plugin install vagrant-vbguest
    - runas: {{ runas_username }}
    - require:
      - pkg: vagrant
