# Create SSH directories and generate SSH keys for users

{% from "core/map.jinja" import core_settings with context %}
{% set hostname = salt.pillar.get('hostname') %}
{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_openssh_server:
    pkg.installed:
      - name: openssh-server

# SSH for runas_user
create_{{ runas_username }}_ssh_directory:
  file.directory:
    - name: /home/{{ runas_username }}/.ssh
    - mode: 0700

generate_{{ runas_username }}_ssh_key:
  cmd.run:
    - name: ssh-keygen -t rsa -b 4096 -C "{{ runas_username }}@{{ hostname }}" -f "/home/{{ runas_username }}/.ssh/id_rsa" -P ""
    - creates: /home/{{ runas_username }}/.ssh/id_rsa
    - require:
      - file: /home/{{ runas_username }}/.ssh

# SSH for other users
{% if core_settings.get('users') %}
{% for username, user_config in core_settings.get('users').iteritems() %}
create_{{ username }}_ssh_directory:
  file.directory:
    - name: /home/{{ username }}/.ssh
    - mode: 0700

generate_{{ username }}_ssh_key:
  cmd.run:
    - name: ssh-keygen -t rsa -b 4096 -C "{{ username }}@{{ hostname }}" -f "/home/{{ username }}/.ssh/id_rsa" -P ""
    - creates: /home/{{ username }}/.ssh/id_rsa
    - require:
      - file: /home/{{ username }}/.ssh
{% endfor %}
{% endif %}
