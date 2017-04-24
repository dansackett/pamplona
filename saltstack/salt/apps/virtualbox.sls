# Install Virtualbox

install_virtualbox:
  pkgrepo.managed:
    - name: deb http://download.virtualbox.org/virtualbox/debian {{ grains['oscodename'] }} contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
    - require_in:
      - pkg: install_virtualbox_5.1

install_virtualbox_5.1:
  pkg.installed:
    - name: virtualbox-5.1
