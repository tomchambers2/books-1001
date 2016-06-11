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

function scaleToDevice() {
	if ($(this).width() < 414) {
		updateSize(1);
	} else if ($(this).width() < 768) {
		updateSize(2);
	} else {
		updateSize(4);
	}
}

$(document).on('ready', function() {
	var size = 2;

	fixLastRow(size);

	scaleToDevice();
	$(window).on('resize', scaleToDevice);

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
