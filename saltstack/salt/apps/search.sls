# Install fzf and ag for more powerful search

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_ag:
  pkg.installed:
    - name: silversearcher-ag

get_fzf_repository:
  git.latest:
    - name: https://github.com/junegunn/fzf.git
    - target: /home/{{ runas_username }}/.fzf
    - user: {{ runas_username }}
    - require:
      - install_ag

install_fzf:
  cmd.wait:
    - name: /home/{{ runas_username }}/.fzf/install --key-bindings --completion --no-update-rc
    - runas: {{ runas_username }}
    - watch:
      - get_fzf_repository
    - require:
      - install_ag
      - get_fzf_repository
