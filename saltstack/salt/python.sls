{% set pips = salt.pillar.get('pips', []) %}

{% if pips %}
python:
  pkg.installed

python3:
  pkg.installed

python-dev:
  pkg.installed

python-setuptools:
  pkg.installed

python-pip:
  pkg.installed

python3-pip:
  pkg.installed
{% endif %}

{% for pip in pips %}
{{ pip }}:
  pip.installed:
    - require:
      - pkg: python
      - pkg: python3
      - pkg: python-dev
      - pkg: python-pip
      - pkg: python3-pip
{% endfor %}
