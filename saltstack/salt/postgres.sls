{% set runas_user = salt.pillar.get('runas_user') %}

postgresql:
  pkg.installed:
    - runas: {{ runas_user }}
    - names:
      - libpq-dev
      - postgresql-9.5

  service.running:
    - runas: {{ runas_user }}
    - require:
      - pkg: postgresql
