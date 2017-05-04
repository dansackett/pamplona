# Install vim-plug for plugin management

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_vim_plug:
  cmd.run:
    - name: curl -fLo /home/{{ runas_username }}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - unless: test -f /home/{{ runas_username }}/.vim/autoload/plug.vim

# @TODO this hijacks the shell since it goes into Vim while in debug mode
# install_vimplug_plugins:
#   cmd.run:
#     - name: vim +PlugInstall
#     - runas: {{ runas_username }}
#     - require:
#       - install_vim_plug
#       - get_dotfiles_repository
