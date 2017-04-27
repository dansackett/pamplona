# Set the hostname for the machine

{% set hostname = salt.pillar.get('hostname') %}
{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

create_hostname_file:
  file.managed:
    - name: /etc/hostname
    - contents: {{ hostname }}

create_hosts_file:
  file.managed:
    - name: /etc/hosts
    - source: salt://core/files/hosts
    - template: jinja

set_hostname:
  cmd.run:
    - name: sudo hostnamectl set-hostname {{ hostname }}
    - runas: {{ runas_username }}
    - unless: test "{{ hostname }}" = "$(hostname)"
