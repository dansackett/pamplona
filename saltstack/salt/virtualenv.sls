{% set users = salt.pillar.get('users', []) %}

virtualenv:
  pip.installed:
    - upgrade: True

virtualenvwrapper:
  pip.installed:
    - upgrade: True

{% for user in users %}
make_virtualenv_directory:
  file.directory:
    - name: /home/{{ user }}/.virtualenvs

make_projects_directory:
  file.directory:
    - name: /home/{{ user }}/projects
{% endfor %}
