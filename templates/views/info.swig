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
					{# <li>Search</li> #}
				</ul>
 				<ul class="buttons">
					<li class="minus disabled">⊖</li>
					<li class="plus disabled">⊕</li>
				</ul>
			</div>
		</header>

		<div class="content info">
		<p>
			This is a library that will be filled with a thousand and one books, each one donated by someone who loves that book and thinks that other people might love it too.
		</p>
		<p>
			On this website you can browse all of the books that have been given and read the personal dedications from the donors.
		</p>
		<p>
			Each book is available to take out and pass on from our physical “A Thousand and One Books Library” which is currently open on Greenwich Peninsula until July  2nd as part of LIFT 16
		</p>
		<p>
			<b>If you have given a book</b><br>
			Each book has a unique number which you have been sent and is trackable here. You can see who has read and is reading it and follow its journey around the world.
		</p>
		<p>
			<b>If you have borrowed a book</b><br>
			Please add your comments and tell us what you thought and where you read it.
		</p>
		<p>
			<b>To give a book</b><br>
			To give your favourite book through our crowdsourcing campaign please <a href="https://www.fundsurfer.com/project/a-thousand-and-one-books">donate here</a>.
		</p>
		<p>
			<b>Contact</b><br>
			<a href="mailto:librarian@athousandandonebooks.com">librarian@athousandandonebooks.com</a>
		</p>
		<p>
			<a href="http://www.empathymuseum.com">www.empathymuseum.com</a>
		</p>

{# 			<img src="/images/empathy-museum-logo.png" class="logo">
			<p>The Empathy Museum is a participatory art project dedicated to helping us look at the world through other people’s eyes in order to help transform our personal relationships and tackle prejudice. We tour our exhibits nationally and internationally.</p> #}

			{% include "./partials/footer.swig" %}
		</div>

	</div>
{% endblock %}
