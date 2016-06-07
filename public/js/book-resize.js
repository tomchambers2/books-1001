var min = 1;
var max = 4;

function updateSize(size) {
	$('.plus').removeClass('disabled');
	$('.minus').removeClass('disabled');
	if (size == min) {
		$('.plus').addClass('disabled');
	} else if (size == max) {
		$('.minus').addClass('disabled');
	}
	$('.books').attr('class', 'books').addClass('books-' + size);

	$('.books .book-void').remove();
	fixLastRow(size);
}

function fixLastRow(size) {
	var overspill = $('.books').children().length % size;
	var requiredVoidBooks = size - overspill;
	if ($('.books').children().length % size > 0) {
		for (var i = 0; i < requiredVoidBooks; i++) {
			$('.books').append('<div class="book-item book-void"></div>')
		}
	}
}

$(document).on('ready', function() {
	var size = 2;

	fixLastRow(size);

	$(window).on('resize', function() {
		if ($(this).width() < 768) {
			updateSize(4);
		} else {
			updateSize(2);
		}
	});

	$('.plus').on('click', function() {
		size--;
		size = Math.max(size, min);
		updateSize(size);
	});

	$('.minus').on('click', function() {
		size++;
		size = Math.min(size, max);
		updateSize(size);
	});
})
