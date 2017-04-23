{% set runas_user = salt.pillar.get('runas_user') %}

install_google_chrome_amd64:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
    - runas: {{ runas_user }}
    - require_in:
      - pkg: google-chrome-stable

google-chrome-stable:
  pkg.installed
