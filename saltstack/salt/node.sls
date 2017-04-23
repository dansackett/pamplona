{% set node_modules = salt.pillar.get('node_modules', []) %}

nodejs_setup:
  cmd.run:
    - name: curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    - require_in:
      - pkg: nodejs

nodejs:
  pkg.installed

{% if node_modules %}
install_node_modules:
  npm.installed:
    - pkgs: {{ node_modules }}
{% endif %}
