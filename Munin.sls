install-munin:
  pkg.installed:
    - name: munin-node
  file.managed:
    - name: /etc/munin/munin-node.conf
    - source: salt://munin/default.conf
    - replace: True
  service.running:
    - enable: True
    - reload: True
    - name: munin-node
    - pkg: munin-node
