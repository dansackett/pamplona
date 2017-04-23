{% set runas_user = salt.pillar.get('runas_user') %}

yarn_repo:
  pkgrepo.managed:
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/yarn.list
    - refresh: True
    - runas: {{ runas_user }}
    - require_in:
      - pkg: yarn

yarn:
  pkg.installed
