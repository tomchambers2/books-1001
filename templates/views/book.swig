{% extends "../layouts/default.swig" %}

{% block content %}
<h1>Book page</h1>

{{book.title}}

<h1>Comments</h1>
{{book.dedication}}
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