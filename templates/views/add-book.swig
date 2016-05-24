{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="main">
		<img src="/images/logo.jpg">

		<div class="content">

			{% if invalidToken %}
				<p>This token is invalid. You may have copy-pasted the link incorrectly from your email or the token may already have been used.</p>
				<p>If you have trouble please send an email to librarian@athousandandonebooks.com</p>
			{% elseif bookAdded %}
				<p>Thank you for your donation! We'll be in touch once the site launches.</p>
			{% else %}
				<p>Thank you so much for giving a book to our pop-up library. Your unique book number is:
					<span class="number">{{number}}</span>
				</p>

				<p>Please fill in the details below and we will buy your book from an independent bookshop. Your dedication will appear on the inside cover.</p>

				<form method="POST">
					<label for="name">Your name</label>
					<input type="text" id="name" name="name" value="{{formData.name}}" placeholder="(as you'd like it to appear in your book)">
					<label for="title">Book Title</label>
					<input type="text" id="title" name="title" value="{{formData.title}}" placeholder="Book Title">
					<label for="author">Author</label>
					<input type="text" id="author" name="author" value="{{formData.author}}" placeholder="Name of author">
					<label for="dedication">I am giving this book because...</label>
					<textarea name="dedication" id="dedication" cols="30" rows="10" placeholder="(in 100 words or less)" maxlength="100">{{formData.dedication}}</textarea>
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

			<hr>

			<footer>
				<p>Visit A Thousand and One Books as part of LIFT 2016</p>

				<p>NOW Gallery – Greenwich Peninsula<br>
				London SE10 0SQ<br>
				Nearest station: North Greenwich<br>
				11 June – 2 July 2016<br>
				Weekdays: 3pm–7pm (closed Mondays)<br>
				Weekends: Midday–7pm</p>

				<iframe class="actAsDiv" width="427" height="405" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;q=NOW%20gallery%20London%20SE10%200SQ&amp;aq=0&amp;ie=UTF8&amp;t=m&amp;z=12&amp;iwloc=A&amp;output=embed"></iframe>
			</footer>
		</div>
	</div>	
{% endblock %}
