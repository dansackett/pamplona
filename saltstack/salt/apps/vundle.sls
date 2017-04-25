# Install Vundle to use my .vimrc

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

get_vundle_repository:
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - target: /home/{{ runas_username }}/.vim/bundle/Vundle.vim
    - user: {{ runas_username }}
    - require:
      - get_dotfiles_repository

# @TODO this hijacks the shell since it goes into Vim while in debug mode
# install_vundle_plugins:
#   cmd.run:
#     - name: vim +PluginInstall +qall
#     - runas: {{ runas_username }}
#     - require:
#       - get_vundle_repository
#       - get_dotfiles_repository
