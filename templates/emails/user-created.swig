{# TODO:
   Jade email templates inherit a default base that's included with Keystone,
   the Swig templates need this to be ported across and bundled directly. #}

{% block body-contents %}
	<span style="font-size:16px">A thousand and one thanks<br>for your donation!</span>
	
	<span style="font-size:16px">Please tell us your book and<br>why you chose it <a href="http://athousandandonebooks.com/add-book/{{token}}/" style="color:#ff0000">HERE</a><br>(a personal story would be great!)</span>
	
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
