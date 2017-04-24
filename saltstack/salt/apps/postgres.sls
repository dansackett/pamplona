# Install Postgresql Database

postgresql:
  pkg.installed:
    - names:
      - libpq-dev
      - postgresql-9.5

  service.running:
    - require:
      - pkg: postgresql
