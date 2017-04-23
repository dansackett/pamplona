{% set runas_user = salt.pillar.get('runas_user') %}

postfix:
  pkg.installed:
    - name: postfix
    - runas: {{ runas_user }}
  service.running:
    - runas: {{ runas_user }}
    - enable: True
    - require:
      - pkg: postfix

/etc/postfix:
  file.directory:
    - runas: {{ runas_user }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

/etc/postfix/main.cf:
  file.managed:
    - source: salt://files/postfix.cf
    - runas: {{ runas_user }}
    - template: jinja
    - mode: 644
    - require:
      - pkg: postfix
