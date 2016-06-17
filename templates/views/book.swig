{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
{% endblock %}

{% block js %}
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDY9jo3HR5kcE-UM5zYPT45LPHGa9gd3ec&libraries=places"></script>
	<script src="/js/history-map.js"></script>
	<script src="/js/autocomplete.js"></script>
	<script src="/js/comment-dropdown.js"></script>
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
					<a href="/#book-{{book.number}}"><li class="minus">⊖</li></a>
					<li class="plus disabled">⊕</li>
				</ul>
			</div>
		</header>

	<section class="book">
		{% if book.image.url %}
		<div class="cover main-cover">
			<img src="{{ book._.image.fit(715,507) }}">
			{% if book.realCover.url %}
				<img src="{{ book._.realCover.fit(715,507) }}">
			{% else %}
				<img src="{{ book._.image.fit(715,507) }}">
			{% endif %}
		</div>
		{% endif %}

		<div class="columns">
			<div class="left">
				<p>&ldquo;{{book.dedication}}&rdquo;</p>
				<p>
					Book {{paddedBookNumber}}<br>
					Donated by {{book.name}}
				</p>
				<p class="highlight">
					{{book.title}}<br>
					{{book.author}}
				</p>

				<div class="comments">
					{% for comment in comments %}
						<div class="comment">
							<p>{{comment.body}}</p>
							<p><b>{{comment.name}}</b></p>
						</div>
					{% endfor %}
				</div>

				{# <div id="map" data-comments="{{comments-string}}"></div> #}


				{% if commentAdded %}
					<h2>Thanks for adding your comment, please click the link in your email to make it visible</h2>
				{% else %}
					<p class="read-book">Have you read this book? <a class="add-comment-link">Add your comment</a></p>

					<div class="add-comment">
						{% for error in commentValidationErrors %}
							<p class="highlight">{{error.message}}</p>
						{% endfor %}

						<form method="POST">
							<input type="hidden" name="bookId" value="{{book.id}}">

							<label for="name">Your name</label>
							<input type="text" id="name" name="name" placeholder="Enter your name">

							<label for="body">Comment</label>
							<textarea name="body" id="body" cols="30" rows="10" placeholder="Say a few words about this book"></textarea>

							<label for="email">Email</label>
							<input type="text" id="email" name="email" placeholder="Enter your email">

							<label for="autocomplete">Location</label>
							<input type="text" name="location" id="autocomplete">
							<input type="hidden" name="geo_location_lat" id="geo_location_lat">
							<input type="hidden" name="geo_location_lng" id="geo_location_lng">

							<button type="submit">Add comment</button>
						</form>
					</div>
				{% endif %}
			</div>
			<div class="right">
				<p>Share</p>
				<a target="_blank" href="https://twitter.com/intent/tweet?text=I%20found%20this%20book%20on%20athousandandonebooks.com&url=http%3A%2F%2Fathousandandonebooks.com%2F{{book.number}}">
					<i class="fa fa-twitter" aria-hidden="true"></i>
				</a>
				<a target="_blank" href="http://www.facebook.com/sharer.php?u=http://athousandandonebooks.com/{{book.number}}&t=I%20found%20this%20book%20on%20athousandandonebooks.com">
					<i class="fa fa-facebook" aria-hidden="true"></i>
				</a>
				<a target="_blank" href="mailto:?body=http://athousandandonebooks.com/{{book.number}}&subject=I%20want%20to%20share%20this%20book%20with%20you">
					<i class="fa fa-reply" aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</div>
{% endblock %}
