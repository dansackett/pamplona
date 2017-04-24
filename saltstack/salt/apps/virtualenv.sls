# Install virtualenv and virtualenvwrapper

{% from "core/map.jinja" import core_settings with context %}

install_virtualenv:
  pip.installed:
    - name: virtualenv
    - upgrade: True

install_virtualenvwrapper:
  pip.installed:
    - name: virtualenvwrapper
    - upgrade: True

{% if core_settings.get('users') %}
{% for username, user_config in core_settings.get('users').iteritems() %}
make_virtualenv_directory_for_{{ username }}:
  file.directory:
    - name: /home/{{ username }}/.virtualenvs

make_projects_directory_for_{{ username }}:
  file.directory:
    - name: /home/{{ username }}/projects
{% endfor %}
{% endif %}
