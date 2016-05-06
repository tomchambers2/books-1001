{% extends "../layouts/default.swig" %}

{% block js %}
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDY9jo3HR5kcE-UM5zYPT45LPHGa9gd3ec&libraries=places"></script>
	<script src="/js/history-map.js"></script>
	<script src="/js/autocomplete.js"></script>
{% endblock %}

{% block content %}
	<h2>{{book.title}} by {{book.author}}</h2>

	<p>
		<img src="{{ book._.image.fit(500,600) }}">
	</p>

	<h1>Comments</h1>
	<p>{{book.dedication}}</p>
	<p>Dedication by {{book.name}}, donator of this book</p>
	{% for comment in comments %}
		<p>{{comment.body}}</p>
		<p><b>{{comment.name}}</b></p>
		<hr>
	{% endfor %}

	<div id="map" data-comments="{{comments-string}}"></div>

	{% if commentAdded %}
		<h2>Thanks for adding your comment, please click the link in your email to make it visible</h2>
	{% else %}
		{% for error in commentValidationErrors %}
			{{error}}
		{% endfor %}

		<h1>Add comment</h1>
		<form method="POST">
			<input type="hidden" name="bookId" value="{{book.id}}">
			Name: <input type="text" name="name">
			Comment:
			<textarea name="body" id="" cols="30" rows="10"></textarea>
			Email: <input type="text" name="email">
			Location: <input type="text" name="location" id="autocomplete">
			<input type="hidden" name="geo_location_lat" id="geo_location_lat">
			<input type="hidden" name="geo_location_lng" id="geo_location_lng">
			<button type="submit">Add comment</button>
		</form>
	{% endif %}
{% endblock %}