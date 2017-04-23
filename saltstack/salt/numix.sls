{% set runas_user = salt.pillar.get('runas_user') %}

install_numix:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/numix/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/numix.list
    - keyid: 43E076121739DEE5FB96BBED52B709720F164EEB
    - keyserver: keyserver.ubuntu.com
    - runas: {{ runas_user }}
    - require_in:
      - pkg: numix-gtk-theme
      - pkg: numix-icon-theme-circle

numix-gtk-theme:
  pkg.installed

numix-icon-theme-circle:
  pkg.installed
