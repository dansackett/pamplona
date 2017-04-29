# Install my Dotfiles

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

get_dotfiles_repository:
  git.latest:
    - name: https://github.com/dansackett/dotfiles.git
    - target: /home/{{ runas_username }}/projects/dotfiles
    - user: {{ runas_username }}

copy_dotfiles_to_home_directory:
  cmd.run:
    - name: python /home/{{ runas_username }}/projects/dotfiles/build.py
    - runas: {{ runas_username }}
    - require:
      - get_dotfiles_repository
