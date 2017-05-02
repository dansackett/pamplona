# Install Postgresql Database

postgresql:
  pkg.installed:
    - names:
      - libpq-dev
      - postgresql-9.5
      - postgresql-client-9.5
      - postgresql-client-common

  service.running:
    - require:
      - pkg: postgresql
