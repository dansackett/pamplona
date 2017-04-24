# Install Shutter Screenshot Tool

install_shutter_repo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/shutter/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/numix.list
    - keyid: 5017D4931D0ACADE295B68ADFC6D7D9D009ED615
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: install_shutter

install_shutter:
  pkg.installed:
    - name: shutter
