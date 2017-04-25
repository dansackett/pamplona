# Install my Dotfiles

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

get_dotfiles_repository:
  git.latest:
    - name: https://github.com/dansackett/dotfiles.git
    - target: /home/{{ runas_username }}/dotfiles
    - user: {{ runas_username }}

copy_dotfiles_to_home_directory:
  cmd.run:
    - name: rsync -av --exclude='.git' /home/{{ runas_username }}/dotfiles/ /home/{{ runas_username }}/
    - runas: {{ runas_username }}
    - require:
      - get_dotfiles_repository
