#!/usr/bin/env bash
{% from "apps/map.jinja" import apps_settings with context %}
{% set configure_apps = apps_settings.get('configure_apps') %}
{% set golang_settings = configure_apps.get('golang') %}
# WARNING!!   This file is managed by Salt
# All edits will be lost on the next highstate
export GOROOT={{ golang_settings.go_root }}
export GOPATH={{ golang_settings.go_path }}
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
