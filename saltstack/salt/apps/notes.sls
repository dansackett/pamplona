# Install my personal notebook

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

get_notes_repository:
  git.latest:
    - name: https://github.com/dansackett/notes.git
    - target: /home/{{ runas_username }}/projects/notes
    - user: {{ runas_username }}

copy_notes_to_home_directory:
  cmd.run:
    - name: python /home/{{ runas_username }}/projects/notes/init.py
    - runas: {{ runas_username }}
    - require:
      - get_notes_repository
