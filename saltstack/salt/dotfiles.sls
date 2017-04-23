{% set runas_user = salt.pillar.get('runas_user') %}

dotfiles:
  cmd.run:
    - runas: {{ runas_user }}
    - name: git clone https://github.com/dansackett/dotfiles.git && cp -r dotfiles/* ../
    - require:
      - pkg: git
