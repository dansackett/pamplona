# Install Redis Server

{% set runas_user = salt.pillar.get('runas_user') %}
{% set runas_username = runas_user.get('username') %}

install_redis_server:
  pkg.installed:
    - name: redis-server

create_redis_group:
  group.present:
    - name: redis
    - addusers:
      - {{ runas_username }}
    - require:
      - pkg: redis-server

create_redis_config:
  file.managed:
    - name: /etc/redis/redis.conf
    - source: salt://apps/files/redis.conf
    - group: redis
    - template: jinja
    - mode: 644
    - require:
      - pkg: redis-server
