lietu:
    group.present:
        - system: False
    user.present:
        - fullname: Janne Enberg
        - shell: /bin/bash
        - home: /home/lietu
        - groups:
            - lietu

/home/lietu/:
    file.directory:
        - user: lietu
        - group: lietu
        - mode: 750
        - makedirs: True

/home/lietu/.bashrc:
    file.managed:
        - source: salt://default/bashrc
        - user: lietu
        - group: lietu
        - mode: 700

/home/lietu/.ssh:
    file.directory:
        - user: lietu
        - group: lietu
        - mode: 0700
        - makedirs: True

/home/lietu/.ssh/authorized_keys:
    file.managed:
        - source: salt://default/authorized_keys
        - user: lietu
        - group: lietu
        - mode: 600

/etc/toprc:
    file.managed:
        - source: salt://default/toprc
        - user: root
        - group: root
        - mode: 644

# Bunch of useful tools people want on the machines
{% for pkg in 'gcc', 'vim-enhanced', 'nano', 'lsof', 'wget', 'curl', 'strace', 'httpd-tools', 'bzip2', 'policycoreutils-python' %}
{{ pkg }}:
    pkg.installed
{% endfor %}
