{% set runas_user = salt.pillar.get('runas_user') %}

install_ms_web_fonts:
  debconf.set:
    - runas: {{ runas_user }}
    - name: ttf-mscorefonts-installer
    - data: { 'msttcorefonts/accepted-mscorefonts-eula': { 'type': 'boolean', 'value': True } }
  pkg.installed:
    - runas: {{ runas_user }}
    - pkgs:
      - ttf-mscorefonts-installer
    - requires:
      - debconf: ttf-mscorefonts-installer
