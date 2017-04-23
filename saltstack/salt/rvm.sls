{% set runas_user = salt.pillar.get('runas_user') %}
{% set ruby = salt.pillar.get('ruby') %}

install_rvm:
  cmd.run:
    - runas: {{ runas_user }}
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    - name: curl -sSL https://get.rvm.io | bash -s stable

{% if ruby.versions %}
{% for version in ruby.versions %}
install_ruby_{{ version }}:
  cmd.run:
    - runas: {{ runas_user }}
    - name: source /home/{{ runas_user }}/.rvm/scripts/rvm && rvm install {{ version }}
{% endfor %}
{% endif %}

rvm_use:
  cmd.run:
    - runas: {{ runas_user }}
    - name: source /home/{{ runas_user }}/.rvm/scripts/rvm && rvm --default use {{ ruby.default }}
