{% set runas_user = salt.pillar.get('runas_user') %}
{% set git_config = salt.pillar.get('git') %}

git:
  pkg.installed

git-gui:
  pkg.installed

user.name:
  git.config_set:
    - value: {{ git_config.user.name }}
    - global: true
    - require:
      - pkg: git

user.email:
  git.config_set:
    - value: {{ git_config.user.email }}
    - global: true
    - require:
      - pkg: git

core.editor:
  git.config_set:
    - value: vim
    - global: true
    - require:
      - pkg: git

merge.tool:
  git.config_set:
    - value: meld
    - global: true
    - require:
      - pkg: git
