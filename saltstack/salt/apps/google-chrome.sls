# Install and configure Google Chrome

install_google_chrome_repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: install_google_chrome_stable

install_google_chrome_stable:
  pkg.installed:
    - name: google-chrome-stable
