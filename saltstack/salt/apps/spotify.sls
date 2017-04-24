# Install Spotify

install_spotify_repo:
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - file: /etc/apt/sources.list.d/spotify.list
    - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: install_spotify_client

install_spotify_client:
  pkg.installed:
    - name: spotify-client
