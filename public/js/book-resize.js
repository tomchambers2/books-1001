var min = 1;
var max = 4;
var size;
var booksList;

function updateSize(size) {
	size = size;
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
	$('.book-void').remove();
	var overspill = $('.books').children().length % size;
	var requiredVoidBooks = size - overspill;
	if ($('.books').children().length % size > 0) {
		for (var i = 0; i < requiredVoidBooks; i++) {
			$('.books').append('<div class="book-item book-void"></div>')
		}
	}
}

function scaleToDevice() {
	if ($(this).width() < 768) {
		size = 1;
		updateSize(size);
	} else {
		size = 2;
		updateSize(size);
	}
}

function initSearch() {
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
		booksList.search();
	});	
}

$(document).on('ready', function() {
	size = 2;

	initSearch();

	var options = {
	valueNames: ['title','number','author','name'],
	listClass: 'books',
	item: 'book-item'
	};

	booksList = new List('books-list', options);

	booksList.on('updated', function() {
		fixLastRow(size);
	})

	$('.search-input').keyup(function() {
		fixLastRow(size);
	});	

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
