{% block body-contents %}
	<p style="font-size:16px">You recently made a comment on a book at A Thousand and One Books</p>
	
	<p style="font-size:16px">Please click on this link to confirm your comment and make it visible</p>

	<p style="font-size:16px"><a href="http://athousandandonebooks.com/{{book.number}}?confirm=comment&token={{token}}">http://athousandandonebooks.com/{{book.number}}?confirm=comment&token={{token}}</a></p>

	
	<p style="font-size:14px">
		A Thousand and One Books will open at:<br>
		NOW Gallery - Greenwich Peninsula<br>
		London SE 10 0SQ<br>
		11 June - 2 July 2016
	</p>
	<p style="font-size:14px">Please come and see us there</p>
	<p style="font-size:14px">The Empathy Museum</p>
	<p style="font-size:14px"><a href="http://www.empathymuseum.com">www.empathymuseum.com</a></p>
	
	<img src="/images/empathy-museum-logo.png">
{% endblock %}
