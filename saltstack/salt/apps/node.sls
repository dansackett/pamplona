# Install NodeJS and NPM

{% from "apps/map.jinja" import apps_settings with context %}
{% set node_modules = apps_settings.get('install_node_modules') %}

setup_nodejs:
  cmd.run:
    - name: curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    - unless: which nodejs
    - require_in:
      - pkg: nodejs

install_nodejs:
  pkg.installed:
    - name: nodejs

{% if node_modules %}
install_node_modules:
  npm.installed:
    - pkgs: {{ node_modules }}
{% endif %}
