{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
{% endblock %}

{% block content %}
	<div class="home-content">
		<header class="home">
			<div class="masthead">
				<span class="title">The Empathy Museum presents</span>
				<img src="/images/empathy-museum-black.jpg" width="292" height="77">
			</div>
			<div class="buttons">
				<ul class="links">
					<li>Info</li>
					<li>Search</li>
				</ul>
				<ul class="buttons">
					<li class="minus">⊖</li>
					<li class="plus">⊕</li>
				</ul>
			</div>
		</header>

		<div class="books">
			{% for book in books %}
					<div class="book-item">
						<a href="./{{ book.number }}">
							{% if book.image.exists %}
								<p><img src="{{ book._.image.thumbnail(100,100) }}"></p>
							{% else %}
								<p><img src="/images/book-placeholder.jpg"></p>
							{% endif %}
						</a>
						Donated by {{book.name}}
					</div>
			{% endfor %}
		</div>
	</div>
{% endblock %}
