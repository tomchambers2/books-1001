{% extends "../layouts/default.swig" %}

{% block content %}
	{% if invalidToken %}
		<p>This token is invalid. You may have copy-pasted the link incorrectly from your email or the token may already have been used.</p>
		<p>If you have trouble please send an email to librarian@athousandandonebooks.com</p>
	{% else %}
		<p>Thank you so much for giving a book to our pop-up library. Your unique book number is:
			<span class="number">{{number}}</span>
		</p>

		<p>Please fill in the details below and we will buy your book from an independent bookshop. Your dedication will appear on the inside cover.</p>

		<form method="POST">
			<label for="name">Your name</label>
			<input type="text" id="name" name="name" placeholder="(as you'd like it to appear in your book)">
			<label for="title">Book Title</label>
			<input type="text" id="author" name="title" placeholder="Book Title">
			<label for="author">Author</label>
			<input type="text" id="author" name="author" placeholder="Name of author">
			<label for="dedication">I am giving this book because...</label>
			<textarea name="dedication" id="dedication" cols="30" rows="10" placeholder="(in 100 words or less)"></textarea>
			<button type="submit">Submit</button>
		</form>

		<p>You will be able to follow the journey of your book as it travels around the world at <a href="http://www.athousandandonebooks.com">www.athousandandonebooks.com</a></p>

		<p>Thanks again!</p>

		<p>
			-<br>
			<img src="/images/empathy-museum-logo.png"><br>
			<a href="http://www.empathymuseum.com">www.empathymuseum.com</a><br>
			<img src="/images/social-icons.jpg" alt="">
		</p>
	{% endif %}
{% endblock %}