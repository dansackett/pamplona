{% set runas_user = salt.pillar.get('runas_user') %}

redis-server:
  pkg.installed

redis_group:
  group.present:
    - name: redis
    - addusers:
      - {{ runas_user }}
    - require:
      - pkg: redis-server

/etc/redis/redis.conf:
  file.managed:
    - source: salt://files/redis.conf
    - runas: {{ runas_user }}
    - group: redis
    - template: jinja
    - mode: 644
    - require:
      - pkg: redis-server
