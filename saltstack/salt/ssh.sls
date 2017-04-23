{% set users = salt.pillar.get('users', []) %}

openssh-server:
    pkg.installed

{% for user in users %}
/home/{{ user }}/.ssh:
  file.directory:
    - mode: 0700

ssh-keygen -t rsa -b 4096 -C "{{ user }}@pamplona" -f "/home/{{ user }}/.ssh/id_rsa" -P "":
  cmd.run:
    - creates: /home/{{ user }}/.ssh/id_rsa
    - require:
      - file: /home/{{ user }}/.ssh
{% endfor %}
