$(document).on('ready', function() {
  $(window).on('scroll', function() {
      if($(window).scrollTop() + $(window).height() >= $('.books').position().top + $('.books').innerHeight()) {
          var loading = true;
          $.get('/load-books', function(result) {
            result.forEach(function(book) {
              var newBook = '<div class="book-item">'
              newBook += '<a href="./' + book.number + '">'
              newBook += '<img src="' + book.image.url + '">'
              newBook += '</a>'
    					newBook += '<span class="donator">Donated by ' + book.name + '</span>'
    					newBook += '</div>'
              $('.books').append(newBook);
            });
            loading = false;
          });
      }
  });
});
