{% extends "../layouts/default.swig" %}

{% block content %}
	<h1>Recovery your book number</h1>
	{% if recovered %}
		<p>Thanks, if a record exists for that email, we'll send you the details of your donation.</p>
	{% else %}
		<p>If you've lost the number of your book, please enter your email address and we'll send it to you.</p>
		
		<form>
			<label for="email">Your email</label>
			<input type="email">
			<button type="submit">Submit</button>
		</form>
	{% endif %}
{% endblock %}
