{% set users = salt.pillar.get('users', []) %}

{% for user in users %}
{{ user }}:
  user.present:
    - fullname: Dan Sackett
    - shell: /bin/bash
    - home: /home/{{ user }}
{% endfor %}

testuser:
  user.absent
