# Install Packages from Pillar data through apt-get

{% from "core/map.jinja" import core_settings with context %}

{% if core_settings.get('install_apt_packages') %}
install_apt_packages:
  pkg.installed:
    - pkgs: {{ core_settings.get('install_apt_packages') }}
{% endif %}
