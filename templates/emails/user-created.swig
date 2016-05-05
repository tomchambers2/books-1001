{# TODO:
   Jade email templates inherit a default base that's included with Keystone,
   the Swig templates need this to be ported across and bundled directly. #}

{% block body-contents %}
	<h1>A thousand and one thanks<br>for your donation!</h1>

	<h1>Please tell us your book and<br>why you chose it <a href="http://athousandandonebooks.com/add-book/{{token}}/">HERE</a><br>(a personal story would be great!)</h1>

	<p>
		A Thousand and One Books will open at:<br>
		NOW Gallery - Greenwich Peninsula<br>
		London SE 10 0SQ<br>
		11 June - 2 July 2016
	</p>
	<p>Please come and see us there</p>
	<p>The Empathy Museum</p>
	<p><a href="http://www.empathymuseum.com">www.empathymuseum.com</a></p>

	<img src="http://athousandandonebooks.com/public/images/empathy-museum-logo.png">
{% endblock %}
