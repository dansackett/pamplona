# Install Mumble

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

create_mumble_config:
  file.managed:
    - name: /etc/mumble-server.ini
    - source: salt://apps/files/mumble-server.ini
    - owner: {{ runas_username }}
    - runas: {{ runas_username }}
    - group: mumble-server
    - mode: 640
    - require:
      - pkg: mumble-server

install_mumble_server:
  pkg.installed:
    - name: mumble-server
