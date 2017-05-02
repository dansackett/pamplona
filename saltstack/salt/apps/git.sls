# Install and Configure Git

{% from "apps/map.jinja" import apps_settings with context %}
{% set apps_config = apps_settings.get('configure_apps') %}
{% set git_config = apps_config.get('git') %}
{% set git_user = git_config.get('user') %}

git:
  pkg.installed

git-gui:
  pkg.installed

{% if git_user and git_user.get('name') %}
user.name:
  git.config_set:
    - value: {{ git_user.get('name') }}
    - global: true
    - require:
      - pkg: git
{% endif %}

{% if git_user and git_user.get('email') %}
user.email:
  git.config_set:
    - value: {{ git_user.get('email') }}
    - global: true
    - require:
      - pkg: git
{% endif %}

{% if git_config.get('editor') %}
core.editor:
  git.config_set:
    - value: {{ git_config.get('editor') }}
    - global: true
    - require:
      - pkg: git
{% endif %}

{% if git_config.get('merge_tool') %}
merge.tool:
  git.config_set:
    - value: {{ git_config.get('merge_tool') }}
    - global: true
    - require:
      - pkg: git
{% endif %}
