{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
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
					<li>Search</li>
				</ul>
{# 				<ul class="buttons">
					<li class="minus">⊖</li>
					<li class="plus">⊕</li>
				</ul> #}
			</div>
		</header>

		<div class="content info">
			<p>Do you have a book — one you absolutely love — that you would like to share with someone you have never met?</p>
			<p>The Empathy Museum is asking 1001 people to donate a favourite book to its brand new library.</p>
			<p>To take part donate £10. We will email you a form where you can tell us your book and the reason that you chose it. With the money, we will buy the book from an independent bookshop and your name and dedication will appear on the inside cover.</p>
			<p>Visitors to the library can take out the book and go online to share where they read it and what they thought about it. You will be able to track your book’s journey through our website as it is borrowed, read and passed on from one reader to another.</p>
			<p>‘A Thousand and One Books’ will open in June as part of LIFT 2016  and will then tour in the UK and internationally.</p>
			<p>Donate £10 today and make your book part of this unique pop-up library.</p>

			<img src="/images/empathy-museum-logo.png" class="logo">
			<p>The Empathy Museum is a participatory art project dedicated to helping us look at the world through other people’s eyes in order to help transform our personal relationships and tackle prejudice. We tour our exhibits nationally and internationally.</p>

			{% include "./partials/footer.swig" %}
		</div>

	</div>
{% endblock %}
