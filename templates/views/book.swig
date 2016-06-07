{% extends "../layouts/default.swig" %}

{% block js %}
	<script src="/js/book-resize.js"></script>
{% endblock %}

{% block js %}
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDY9jo3HR5kcE-UM5zYPT45LPHGa9gd3ec&libraries=places"></script>
	<script src="/js/history-map.js"></script>
	<script src="/js/autocomplete.js"></script>
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
					<li><a href="/info">Info</a></li>
					{# <li>Search</li> #}
				</ul>
				<ul class="buttons">
					<li class="minus">⊖</li>
					<li class="plus">⊕</li>
				</ul>
			</div>
		</header>

	<section class="book">
		{% if book.image %}
			<img src="{{ book._.image.fit(715,507) }}" width="715">

		{% endif %}

		<div class="columns">
			<div class="left">
				<p>"{{book.dedication}}"</p>
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
					<p>Have you read this book? Add your comment</p>
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
				{% endif %}
			</div>
			<div class="right">
				<p>Share</p>
			</div>
		</div>
	</div>
{% endblock %}
