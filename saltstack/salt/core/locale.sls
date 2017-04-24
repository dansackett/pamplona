# Set the locale for the machine

{% from "core/map.jinja" import core_settings with context %}

locale_system_present:
  locale.present:
    - name: {{ core_settings.get('locale') }}.UTF-8

set_locale_system:
  locale.system:
    - name: {{ core_settings.get('locale') }}.UTF-8
