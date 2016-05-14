{% extends "../layouts/default.swig" %}

{% block content %}
	{% if book %}
		<p>email: {{book.email}}</p>
		<p>link: http://www.athousandandonebooks.com/add-book/{{book.token}}</p>

		<h2>Find another</h2>
	{% else %}
		<p>No book found</p>
	{% endif %}

	<p>Enter an email to retrieve the add book link</p>
	
	<form method="POST">
		<label for="email">User's email</label>
		<input type="email" name="email">
		<button type="submit">Submit</button>
	</form>
{% endblock %}
