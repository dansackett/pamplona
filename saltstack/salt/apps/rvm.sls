# Install RVM and Ruby Versions

{% from "apps/map.jinja" import apps_settings with context %}
{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}
{% set apps_config = apps_settings.get('configure_apps') %}
{% set install_gems = apps_config.get('install_gems') %}
{% set ruby_config = apps_config.get('ruby') %}

{% if ruby_config.get('default') %}
install_ruby_{{ ruby_config.get('default') }}:
  rvm.installed:
    - name: ruby-{{ ruby_config.get('default') }}
    - default: True
    - user: {{ runas_username }}
{% endif %}

{% if ruby_config.get('versions') %}
{% for version in ruby_config.get('versions') %}
install_ruby_{{ version }}:
  rvm.installed:
    - name: ruby-{{ version }}
    - user: {{ runas_username }}
{% endfor %}
{% endif %}

{% if install_gems  %}
{% for gem in install_gems %}
install_{{ gem }}:
  gem.installed:
    - name {{ gem }}
{% endfor %}
{% endif %}
