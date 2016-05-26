var min = 1;
var max = 4;

function updateSize(size) {
	$('.plus').removeClass('disabled');
	$('.minus').removeClass('disabled');
	if (size == max) {
		$('.plus').addClass('disabled');
	} else if (size == min) {
		$('.minus').addClass('disabled');
	}
	$('.books').attr('class', 'books').addClass('books-' + size);
}

$(document).on('ready', function() {
	var size = 2;

	$(window).on('resize', function() {
		if ($(this).width() < 768) {
			console.log('small')
			updateSize(4);
		} else {
			updateSize(2);
		}
	})

	$('.plus').on('click', function() {
		size++;
		size = Math.min(size, max);
		updateSize(size);
	});

	$('.minus').on('click', function() {
		size--;
		size = Math.max(size, min);
		updateSize(size);
	});
})