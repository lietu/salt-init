{% for pkg in 'npm', 'ruby', 'ruby-devel', 'rubygems', 'python-pygments', 'ImageMagick', %}
{{ pkg }}:
    pkg.installed
{% endfor %}

{% for npm in 'less', %}
{{ npm }}:
    npm.installed
{% endfor %}

jekyll:
    gem.installed:
        - version: 0.12.1
        - rdoc: false

{% for gem in 'jekyll-asset-pipeline', 'jekyll-minimagick', 'jekyll-press', 'closure-compiler', %}
{{ gem }}:
    gem.installed
{% endfor %}

