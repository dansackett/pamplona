hostname: pamplona
runas_user:
  username: ubuntu
  full_name: Dan Sackett
core:
  locale: en_US
  timezone: 'America/New_York'
  users:
    ubuntu2:
      full_name: Ubuntu
  install_apt_packages:
    - build-essential
    - libssl-dev
    - libffi-dev
    - libxml2-dev
    - curl
    - vim
    - vim-gnome
    - vim-common
    - htop
    - sqlite3
    - libsqlite3-dev
    - tmux
    - meld
    - terminator
    - redshift
    - redshift-gtk
    - unity-tweak-tool
    - direnv
apps:
  install_apps:
    - docker
    - git
    - google-chrome
    - mumble
    - node
    - numix
    - postfix
    - postgres
    - python
    - redis
    - rvm
    - shutter
    - spotify
    - vagrant
    - virtualbox
    - virtualenv
    - vundle
    - yarn
  install_pips:
    - todooo-cli
    - bpython
  install_node_modules:
    - create-react-app
  configure_apps:
    git:
      user:
        name: Dan Sackett
        email: danesackett@gmail.com
      editor: vim
      merge_tool: meld
    ruby:
      default: 2.3.0
      install_versions:
        - 2.2.0
