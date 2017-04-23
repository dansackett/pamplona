{% set runas_user = salt.pillar.get('runas_user') %}

install_shutter:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/shutter/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/numix.list
    - keyid: 5017D4931D0ACADE295B68ADFC6D7D9D009ED615
    - keyserver: keyserver.ubuntu.com
    - runas: {{ runas_user }}
    - require_in:
      - pkg: shutter

shutter:
  pkg.installed
