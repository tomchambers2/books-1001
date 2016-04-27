{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<div class="jumbotron">
			<h1>Books</h1>
			{% for book in books %}
				<div>
					{% if book.image.exists %}
						<p><img src="{{ book._.image.thumbnail(100,100) }}"></p>
					{% else %}
						<p>generic image</p>
					{% endif %}
					<a href="./{{ book.number }}">{{ book.title }}</a>
				</div>
			{% endfor %}
		</div>
	</div>
{% endblock %}
