{% set runas_user = salt.pillar.get('runas_user') %}
{% set hostname = salt.pillar.get('hostname') %}

hostname_file:
  file.managed:
    - name: /etc/hostname
    - contents: {{ hostname }}
    - runas: {{ runas_user }}

hosts_file:
  file.managed:
    - name: /etc/hosts
    - source: salt://files/hosts
    - template: jinja
    - runas: {{ runas_user }}

set_fqdn:
  cmd.run:
    {% if grains["init"] == "systemd" %}
    - name: hostnamectl set-hostname {{ hostname }}
    {% else %}
    - name: hostname {{ hostname }}
    {% endif %}
    - runas: {{ runas_user }}
    - unless: test "{{ hostname }}" = "$(hostname)"
