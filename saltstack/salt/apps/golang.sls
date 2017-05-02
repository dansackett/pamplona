# Install Golang and Setup Go Variables

{% from "apps/map.jinja" import apps_settings with context %}
{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}
{% set configure_apps = apps_settings.get('configure_apps') %}
{% set golang_settings = configure_apps.get('golang') %}
{% set archive_name = 'go%s.linux-amd64.tar.gz'|format(golang_settings.get('version')) %}
{% set base_dir = '%s/golang/%s'|format(golang_settings.get('prefix'), golang_settings.get('version')) %}

# In the interest of being good netizens, we will only pull down the archive
# if golang is not installed or the specific version is missing
cache_go_archive:
  file.managed:
    - name: /tmp/{{ archive_name }}
    - source: https://storage.googleapis.com/golang/{{ archive_name }}
    - source_hash: https://storage.googleapis.com/golang/{{ archive_name }}.sha256
    - user: {{ runas_username }}
    - unless:
        # asserts go is on our path
        - which go
        # asserts the version of go
        - test -x {{ base_dir }}/go/bin/go


# Extract the archive locally to golang:lookup:base_dir: which has our version
# schema already baked in and extract the archive if necessary
extract_go_archive:
  file.directory:
    - names:
        - {{ base_dir }}
        - {{ golang_settings.go_path }}
    - user: {{ runas_username }}
    - mode: 755
    - makedirs: True
    - unless:
        - test -d {{ base_dir }}
    - recurse:
        - user
        - mode

  archive.extracted:
    - name: {{ base_dir }}
    - source: "/tmp/{{ archive_name }}"
    - source_hash: https://storage.googleapis.com/golang/{{ archive_name }}.sha256
    - archive_format: tar
    - user: {{ runas_username }}
    - options: v
    - watch:
        - file: cache_go_archive
    # cache_go_archive already applies these predicates and the watch
    # statement should cover us, paranoia is an applied art.
    - unless:
        - go version | grep {{ golang_settings.version }}
        - test -x {{ base_dir }}/go/bin/go

# add a symlink from versioned install to point at golang:lookup:go_root
update_go_alternatives:
  alternatives.install:
    - name: golang-home-link
    - link: {{ golang_settings.go_root }}
    - path: {{ base_dir }}/go/
    - priority: 31
    - order: 10
    - watch:
        - archive: extract_go_archive

# add symlinks to /usr/bin for the three go commands
{% for i in ['go', 'godoc', 'gofmt'] %}
create_symlink_{{ i }}:
  alternatives.install:
    - name: link-{{ i }}
    - link: /usr/bin/{{ i }}
    - path: {{ golang_settings.go_root }}/bin/{{ i }}
    - priority: 40
    - order: 10
    - watch:
        - archive: extract_go_archive
{% endfor %}

# sets up the necessary environment variables required for golang usage
setup_bash_profile_for_go:
  file.managed:
    - name: /etc/profile.d/golang.sh
    - source:
        - salt://apps/files/go_profile.sh
    - template: jinja
    - mode: 644
    - user: {{ runas_username }}

{% if apps_settings.get('install_go_packages') %}
{% for pkg in apps_settings.get('install_go_packages') %}
install_{{ pkg }}:
  cmd.run:
    - name: source /etc/profile.d/golang.sh && go get {{ pkg }}
    - require:
      - file: setup_bash_profile_for_go
      - cmd: copy_dotfiles_to_home_directory
      - archive: extract_go_archive
{% endfor %}
{% endif %}
