# Install Python and pip requirements

{% from "apps/map.jinja" import apps_settings with context %}
{% set install_pips = apps_settings.get('install_pips') %}

install_python:
  pkg.installed:
    - name: python

install_python3:
  pkg.installed:
    - name: python3

install_python_dev:
  pkg.installed:
    - name: python-dev

install_python_setuptools:
  pkg.installed:
    - name: python-setuptools

install_python_pip:
  pkg.installed:
    - name: python-pip

install_python3_pip:
  pkg.installed:
    - name: python3-pip

{% if install_pips %}
{% for pip in install_pips %}
install_{{ pip }}:
  pip.installed:
    - name: {{ pip }}
    - require:
      - pkg: python
      - pkg: python3
      - pkg: python-pip
      - pkg: python3-pip
      - pkg: python-dev
{% endfor %}
{% endif %}
