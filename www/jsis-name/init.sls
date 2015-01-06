{% for dir in '/www/sites/jsis-name', '/www/sites/jsis-name-custom',  %}
{{ dir }}:
    file.directory:
        - user: lietu
        - group: lietu
        - mode: 750
        - makedirs: True
{% endfor %}

https://github.com/lietu/jsis.name:
    git.latest:
        - rev: master
        - target: /www/sites/jsis-name
        - require:
            - file: /www/sites

/etc/nginx/sites-available/jsis-name.conf:
    file.managed:
        - source: salt://jsis-name/jsis-name.conf
        - require:
            - pkg: nginx
            - file: /etc/nginx/sites-available/
        - watch_in:
            - service: nginx

/etc/nginx/sites-enabled/01-jsis-name.conf:
    file.symlink:
        - target: /etc/nginx/sites-available/jsis-name.conf
        - require:
            - file: /etc/nginx/sites-enabled/
        - watch_in:
            - service: nginx

jsis-name-jekyll-build:
    cmd.run:
        - name: jekyll
        - cwd: /www/sites/jsis-name
        - user: lietu
        - require:
            - git: https://github.com/lietu/jsis.name
