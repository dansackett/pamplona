{% set runas_user = salt.pillar.get('runas_user') %}

install_vagrant:
  pkg.installed:
    - name: vagrant
    - runas: {{ runas_user }}
    - sources:
      - vagrant: https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb

install_vagrant_guest_additions:
  cmd.run:
    - name: vagrant plugin install vagrant-vbguest
    - runas: {{ runas_user }}
    - require:
      - pkg: vagrant
