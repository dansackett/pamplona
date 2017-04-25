{% from "core/map.jinja" import core_settings with context %}
{% set hostname = salt.pillar.get('hostname') %}

include:
  - core.users
  {% if hostname %}
  - core.hostname
  {% endif %}
  - core.locale
  - core.timezone
  - core.ssh
  - core.restricted-extras
  {% if core_settings.get('install_apt_packages') %}
  - core.apt-packages
  {% endif %}
  - core.dotfiles
