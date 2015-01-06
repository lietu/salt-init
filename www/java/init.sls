{% for pkg in 'java-1.7.0-openjdk', 'java-1.7.0-openjdk-devel', %}
{{ pkg }}:
    pkg.installed
{% endfor %}

/etc/profile.d/java.sh:
    file.managed:
        - source: salt://java/java.sh
        - mode: 755

/etc/java/java.conf:
    file.managed:
        - source: salt://java/java.conf
        - mode: 644
