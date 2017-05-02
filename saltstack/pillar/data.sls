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
    - golang
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
    - vim
    - virtualbox
    - virtualenv
    - vundle
    - yarn
  install_pips:
    - todooo-cli
    - bpython
  install_go_packages:
    - github.com/dansackett/gophersay
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
    golang:
      prefix: /usr/local
      go_root: /usr/local/go
      go_path: /var/lib/golang
      version: '1.8.1'
      archive_hash: 'a579ab19d5237e263254f1eac5352efcf1d70b9dacadb6d6bb12b0911ede8994'
