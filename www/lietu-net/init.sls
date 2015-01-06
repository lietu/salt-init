
{% for dir in '/www/sites/lietu-net', '/www/sites/lietu-net-custom',  %}
{{ dir }}:
    file.directory:
        - user: lietu
        - group: lietu
        - mode: 750
        - makedirs: True
{% endfor %}

https://github.com/lietu/lietunet:
    git.latest:
        - rev: master
        - target: /www/sites/lietu-net
        - require:
            - file: /www/sites

/etc/nginx/sites-available/lietu-net.conf:
    file.managed:
        - source: salt://lietu-net/lietu-net.conf
        - require:
            - pkg: nginx
            - file: /etc/nginx/sites-available/
        - watch_in:
            - service: nginx

/etc/nginx/sites-enabled/00-lietu-net.conf:
    file.symlink:
        - target: /etc/nginx/sites-available/lietu-net.conf
        - require:
            - file: /etc/nginx/sites-enabled/
        - watch_in:
            - service: nginx

lietu-net-jekyll-build:
    cmd.run:
        - name: jekyll
        - cwd: /www/sites/lietu-net
        - user: lietu
        - env:
            - LC_ALL: 'en_US.UTF-8'
            - LANG: 'en_US.UTF-8'
        - require:
            - git: https://github.com/lietu/lietunet
