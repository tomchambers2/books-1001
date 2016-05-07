{% block body-contents %}
	<p style="font-size:16px">You recently requested a reminder of your donation to A Thousand and One Books</p>
	
	<p style="font-size:16px">Your book number is <b>{{number}}</b>
	{% if book.title %}
		and you can see the details at <a href="http://athousandandonebooks.com/{{book.number}}/" style="color:#ff0000">http://athousandandonebooks.com/{{book.number}}/</a><br></p>

		<p>
			{{book.title}} by {{book.author}}<br>
			Your dedication: {{book.dedication}}
		</p>
	{% else %}
		. You haven't given us the details of your book yet. You can do that here: <a href="http://athousandandonebooks.com/add-book/{{book.token}}">http://athousandandonebooks.com/add-book/{{book.token}}</a></p>
	{% endif %}
	
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
