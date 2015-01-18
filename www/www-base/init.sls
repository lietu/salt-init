nginx:
    pkg:
        - installed
    user.present:
        - fullname: nginx
        - shell: /bin/false
        - home: /var/www
        - groups:
            - nginx
            - lietu
    service.running:
        - enable: True
        - require:
            - pkg: nginx
        - watch:
            - file: /etc/nginx/nginx.conf

{% for dir in '/etc/nginx/sites-enabled/', '/etc/nginx/sites-available/', '/var/lib/nginx', '/var/lib/nginx/tmp/' %}
{{ dir }}:
    file.directory:
        - user: nginx
        - group: nginx
        - mode: 750
        - makedirs: True
{% endfor %}

{% for dir in '/www/', '/www/sites' %}
{{ dir }}:
    file.directory:
        - user: lietu
        - group: lietu
        - mode: 750
        - makedirs: True
{% endfor %}

/www/sites/link_custom.sh:
    file.managed:
        - source: salt://www-base/link_custom.sh
        - require:
            - file: /www/sites

{% for path in '/etc/nginx/conf.d/', '/etc/nginx/sites-enabled/default' %}
{{ path }}:
    file.absent
{% endfor %}

/etc/nginx/nginx.conf:
    file.managed:
        - source: salt://www-base/nginx.conf
        - require:
            - pkg: nginx

{% for logdir in '/var/log/nginx/', %}
{{ logdir }}:
    file.directory:
        - user: nginx
        - group: nginx
        - mode: 750
        - makedirs: True
{% endfor %}
