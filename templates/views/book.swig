{% extends "../layouts/default.swig" %}

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
			<button type="submit">Add comment</button>
		</form>
	{% endif %}
{% endblock %}