# Install the core runas user and any other users setup in the pillar

{% from "core/map.jinja" import core_settings with context %}
{% set runas_user = salt.pillar.get('runas_user') %}

{{ runas_user.get('username') }}:
  user.present:
    - fullname: {{ runas_user.get('full_name') }}
    - shell: /bin/bash
    - home: /home/{{ runas_user.get('username') }}

{% if core_settings.get('users') %}
{% for username, user_config in core_settings.get('users').iteritems() %}
{{ username }}:
  user.present:
    - fullname: {{ user_config.get('full_name') }}
    - shell: /bin/bash
    - home: /home/{{ username }}
{% endfor %}
{% endif %}
