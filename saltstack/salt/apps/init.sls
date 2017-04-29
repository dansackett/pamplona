{% from "apps/map.jinja" import apps_settings with context %}

include:
  {% if 'vim' in apps_settings.get('install_apps') %}
  - apps.vim
  {% endif %}
  {% if 'golang' in apps_settings.get('install_apps') %}
  - apps.golang
  {% endif %}
  {% if 'vundle' in apps_settings.get('install_apps') %}
  - apps.vundle
  {% endif %}
  {% if 'python' in apps_settings.get('install_apps') %}
  - apps.python
  {% endif %}
  {% if 'virtualenv' in apps_settings.get('install_apps') %}
  - apps.virtualenv
  {% endif %}
  {% if 'git' in apps_settings.get('install_apps') %}
  - apps.git
  {% endif %}
  {% if 'google-chrome' in apps_settings.get('install_apps') %}
  - apps.google-chrome
  {% endif %}
  {% if 'spotify' in apps_settings.get('install_apps') %}
  - apps.spotify
  {% endif %}
  {% if 'virtualbox' in apps_settings.get('install_apps') %}
  - apps.virtualbox
  {% endif %}
  {% if 'vagrant' in apps_settings.get('install_apps') %}
  - apps.vagrant
  {% endif %}
  {% if 'redis' in apps_settings.get('install_apps') %}
  - apps.redis
  {% endif %}
  {% if 'postfix' in apps_settings.get('install_apps') %}
  - apps.postfix
  {% endif %}
  {% if 'node' in apps_settings.get('install_apps') %}
  - apps.node
  {% endif %}
  {% if 'yarn' in apps_settings.get('install_apps') %}
  - apps.yarn
  {% endif %}
  {% if 'mumble' in apps_settings.get('install_apps') %}
  - apps.mumble
  {% endif %}
  {% if 'numix' in apps_settings.get('install_apps') %}
  - apps.numix
  {% endif %}
  {% if 'postgres' in apps_settings.get('install_apps') %}
  - apps.postgres
  {% endif %}
  {% if 'shutter' in apps_settings.get('install_apps') %}
  - apps.shutter
  {% endif %}
  {% if 'docker' in apps_settings.get('install_apps') %}
  - apps.docker
  {% endif %}
  {% if 'rvm' in apps_settings.get('install_apps') %}
  - apps.rvm
  {% endif %}
