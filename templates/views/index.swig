{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
	<script src="/js/infinite-scroll.js"></script>
{% endblock %}

{% block content %}
	<div class="home-content">
		<header class="home">
			<div class="masthead">
				<span class="title">The Empathy Museum presents</span>
				<a href="/"><img src="/images/empathy-museum-black.jpg" width="292" height="77"></a>
			</div>
			<div class="buttons">
				<ul class="links">
					<li><a href="/info">Info</a></li>
					{# <li>Search</li> #}
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
						<div class="book-image">
						<a href="./{{ book.number }}">
							{% if book.image.exists %}
								<img src="{{ book._.image.fill(355, 355) }}">
							{% else %}
								<div class="book-placeholder"></div>
							{% endif %}
						</a>
						</div>
						<span class="donator">Donated by {{book.name}}</span>
					</div>
			{% endfor %}
		</div>
	</div>
{% endblock %}
