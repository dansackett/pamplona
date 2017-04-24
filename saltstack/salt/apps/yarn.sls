# Install Yarn

install_yarn_repo:
  pkgrepo.managed:
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/yarn.list
    - refresh: True
    - require_in:
      - pkg: yarn

install_yarn:
  pkg.installed:
    - name: yarn
