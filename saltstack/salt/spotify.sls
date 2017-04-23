{% set runas_user = salt.pillar.get('runas_user') %}

install_spotify:
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - file: /etc/apt/sources.list.d/spotify.list
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com
    - runas: {{ runas_user }}
    - require_in:
      - pkg: spotify-client

spotify-client:
  pkg.installed
