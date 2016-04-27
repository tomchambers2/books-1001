{% extends "../layouts/default.swig" %}

{% block intro %}
	<div class="container">
		<h1>Add fyour book</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">
		{% for error in validationErrors %}
			{{ error }}
		{% endfor %}
		{% if enquirySubmitted %}
			<h3>Thanks for adding your book</h3>
		{% else %}
			<div class="row">
				<div class="col-sm-8 col-md-6">
					<form method="post">
						<input type="text" name="title">
						<button type="submit">Add book</button>
					</form>
				</div>
			</div>
		{% endif %}
	</div>
{% endblock %}
