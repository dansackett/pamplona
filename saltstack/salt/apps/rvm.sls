# Install RVM and Ruby Versions

{% from "apps/map.jinja" import apps_settings with context %}
{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}
{% set apps_config = apps_settings.get('configure_apps') %}
{% set ruby_config = apps_config.get('git') %}

install_rvm:
  cmd.run:
    - runas: {{ runas_username }}
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    - name: curl -sSL https://get.rvm.io | bash -s stable

{% if ruby_config.get('versions') %}
{% for version in ruby_config.get('versions') %}
install_ruby_{{ version }}:
  cmd.run:
    - runas: {{ runas_username }}
    - name: source /home/{{ runas_username }}/.rvm/scripts/rvm && rvm install {{ version }}
{% endfor %}
{% endif %}

{% if ruby_config.get('default') %}
rvm_use:
  cmd.run:
    - runas: {{ runas_username }}
    - name: source /home/{{ runas_username }}/.rvm/scripts/rvm && rvm --default use {{ ruby_config.get('default') }}
{% endif %}

{% if ruby_config.get('install_gems')  %}
{% for gem in ruby_config.get('install_gems') %}
install_{{ gem }}:
  gem.installed:
    - name {{ gem }}
{% endfor %}
{% endif %}
