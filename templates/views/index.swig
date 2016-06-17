{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
	<script src="/js/lib/list.js"></script>
	<script src="/js/list-init.js"></script>
	<script src="/js/show-search.js"></script>
	{#<script src="/js/infinite-scroll.js"></script>#}
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
				</ul>
				<ul class="buttons">
					<li class="minus">⊖</li>
					<li class="plus">⊕</li>
				</ul>
			</div>
		</header>

		<div id="books-list" class="books-list">

			<div class="search-box">
				<span class="search-title">Search by number, donator, author or title</span>
				<input id="search" class="search search-input" placeholder="Search by number, donator, author or title" />
			</div>

			<div class="books">
				{% for book in books %}
						<div class="book-item" id="book-item">
							<a name="book-{{book.number}}">
							<a href="./{{ book.number }}" class="book-image">
								{% if book.image.exists %}
									<div class="cover">
										<img src="{{ book._.image.fill(730) }}">
										{% if book.realCover.url %}
											<img src="{{ book._.realCover.fill(730) }}" width="715">
										{% else %}
											<img src="{{ book._.image.fill(730) }}" width="715">
										{% endif %}
									</div>
								{% else %}
									<img src="/images/coming-soon.png">
								{% endif %}
							</a>
							<span class="number hidden">{{book.number}}</span>
							<span class="author hidden">{{book.author}}</span>
							<span class="title hidden">{{book.title}}</span>							
							<span class="donator">Donated by <span class="name">{{book.name}}</span></span>
						</div>
				{% endfor %}
			</div>
		</div>
	</div>
{% endblock %}
