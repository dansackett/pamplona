# Install Postfix for emails

postfix:
  pkg.installed:
    - name: postfix

  service.running:
    - enable: True
    - require:
      - pkg: postfix

create_postfix_directory:
  file.directory:
    - name: /etc/postfix
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

create_postfix_config:
  file.managed:
    - name: /etc/postfix/main.cf
    - source: salt://apps/files/postfix.cf
    - template: jinja
    - mode: 644
    - require:
      - pkg: postfix
