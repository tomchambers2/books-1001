{% extends "../layouts/default.swig" %}

{% block content %}
	<h1>A Thousand and One Books Is Launching Soon!</h1>
	{# <h1>Books</h1>
	{% for book in books %}
		<div>
			{% if book.image.exists %}
				<p><img src="{{ book._.image.thumbnail(100,100) }}"></p>
			{% else %}
				<p>generic image</p>
			{% endif %}
			<a href="./{{ book.number }}">{{ book.title }}</a>
		</div>
	{% endfor %} #}
{% endblock %}
