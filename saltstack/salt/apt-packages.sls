{% set runas_user = salt.pillar.get('runas_user') %}
{% set apt_packages = salt.pillar.get('apt_packages', []) %}

{% if apt_packages %}
install_apt_packages:
  pkg.installed:
    - runas: {{ runas_user }}
    - pkgs: {{ apt_packages }}
{% endif %}
