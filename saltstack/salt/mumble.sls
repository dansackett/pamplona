{% set runas_user = salt.pillar.get('runas_user') %}

mumble-server:
  pkg.installed

/etc/mumble-server.ini:
  file.managed:
    - source: salt://files/mumble-server.ini
    - owner: {{ runas_user }}
    - runas: {{ runas_user }}
    - group: mumble-server
    - mode: 640
    - require:
      - pkg: mumble-server
