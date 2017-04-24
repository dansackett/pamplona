# Set the timezone for the machine

{% from "core/map.jinja" import core_settings with context %}

set_timezone:
  timezone.system:
   - name: {{ core_settings.get('locale') }}
