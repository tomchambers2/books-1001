{% import "../mixins/flash-messages.swig" as FlashMessages %}

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<script type="text/javascript" src="//fast.fonts.net/jsapi/673c680f-99a4-498e-8dce-eadea32e016d.js"></script>

		<title>{{ title|default("A Thousand and One Books") }}</title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

		{# Customise the stylesheet for your site by editing /public/styles/site.sass #}
		<link href="/styles/site.css" rel="stylesheet">

		{# This file provides the default styling for the KeystoneJS Content Editor #}
		{%- if user and user.canAccessKeystone -%}
			<link href="/keystone/styles/content/editor.min.css" rel="stylesheet">
		{%- endif -%}

		{# HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
		   Safely remove this block if you are not targeting IE8 #}
		<!--[if lt IE 9]>
			<script src="//cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.js"></script>
			<script src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		{# Include template-specific stylesheets by extending the css block #}
		{%- block css %}{% endblock -%}

		{# Add any other template-specific HEAD tags by extending the head block #}
		{%- block head %}{% endblock %}
	</head>
	<body>
		{%- block intro -%}{%- endblock -%}
		{{ FlashMessages.renderMessages(messages) }}

		<div class="main">
			<img src="/images/logo.jpg">

			<div class="content">	
				{%- block content -%}{%- endblock -%}
		
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

		{# JAVASCRIPT #}

		{# jQuery 1.11.3 is included by default, and required by both Bootstrap
			and the KeystoneJS Content Editor. If you are not targeting IE8,
			you can upgrade to 2.1.4 (also bundled) for better performance. #}
		<script src="/js/jquery/jquery-1.11.3.min.js"></script>

		{# Customise which Bootstrap javascript files are served by including
			them specifically here, instead of bootstrap-3.3.5.min.js #}
		<script src="/js/bootstrap/bootstrap-3.3.5.min.js"></script>

		{# The KeystoneJS Content Editor provides support for ks-editable data attributes,
			which generate links to edit content for users who can access Keystone #}
		{% if user and user.canAccessKeystone -%}
			<script src="/keystone/js/content/editor.js"></script>
		{%- endif -%}


		{# Add scripts that are globally required by your site here. #}

		{# Include template-specific javascript files by extending the js block #}
		{%- block js -%}{%- endblock -%}
	</body>
</html>
