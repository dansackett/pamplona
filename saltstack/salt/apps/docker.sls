# Install Docker and Docker Compose

{% set runas_user = salt.pillar.get('runas_user') %}

docker_package_dependencies:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - python-apt
      - iptables
      - ca-certificates

install_docker:
  pkgrepo.managed:
    - name: deb https://apt.dockerproject.org/repo {{ grains['os']|lower }}-{{ grains['oscodename'] }} main
    - humanname: {{ grains['os'] }} {{ grains['oscodename']|capitalize }} Docker Package Repository
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: hkp://p80.pool.sks-keyservers.net:80
    - file: /etc/apt/sources.list.d/docker.list
    - refresh_db: True

docker_package:
  pkg.latest:
    - name: docker-engine
    - refresh: True
    - require:
      - pkg: docker_package_dependencies
      - pkgrepo: install_docker

docker_service:
  service.running:
    - name: docker
    - enable: True
    - watch:
      - pkg: docker_package

install_docker_compose:
  pip.installed:
    - name: docker-compose
