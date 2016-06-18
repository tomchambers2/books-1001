$(document).on('ready', function() {
	$('.search-title').on('click', function() {
		$('.search-title').hide();
		$('.search-input').show();
		$('.clear').show();
		$('.search-input').focus();
	});

	$('.search-input').on('blur', function() {
		if (!$('.search-input').val()) {
			$('.search-title').show();
			$('.search-input').hide();
			$('.clear').hide();
		}
	})

	$('.clear').click(function() {
		$('.search-input').val("");
		$('.search-input').focus();
	})
});