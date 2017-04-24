hostname: pamplona
runas_user:
  username: dan
  full_name: Dan Sackett
core:
  locale: en_US
  timezone: 'America/New_York'
  users:
    ubuntu:
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
    - yarn
  configure_apps:
    install_pips:
      - todooo-cli
      - bpython
    install_node_modules:
      - create-react-app
    git:
      user:
        name: Dan Sackett
        email: danesackett@gmail.com
      editor: vim
      merge_tool: meld
    ruby:
      default: 2.3.0
      install_versions:
        - 2.3.0
