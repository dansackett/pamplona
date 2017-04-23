{% set runas_user = salt.pillar.get('runas_user') %}

install_virtualbox:
  pkgrepo.managed:
    - name: deb http://download.virtualbox.org/virtualbox/debian {{ grains['oscodename'] }} contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - runas: {{ runas_user }}
    - require_in:
      - pkg: virtualbox-5.1

virtualbox-5.1:
  pkg.installed
