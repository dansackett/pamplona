# Install the latest Vim version

install_vim_repo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/jonathonf/vim/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/vim.list
    - keyid: 4AB0F789CBA31744CC7DA76A8CF63AD3F06FC659
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: install_vim

install_vim:
  pkg.installed:
    - name: vim
