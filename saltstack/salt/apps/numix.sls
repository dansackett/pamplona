# Install Numix Icon Set

install_numix:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/numix/ppa/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/numix.list
    - keyid: 43E076121739DEE5FB96BBED52B709720F164EEB
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: install_numix_gtk_theme
      - pkg: install_numix_icon_theme_circle

install_numix_gtk_theme:
  pkg.installed:
    - name: numix-gtk-theme

install_numix_icon_theme_circle:
  pkg.installed:
    - name: numix-icon-theme-circle
