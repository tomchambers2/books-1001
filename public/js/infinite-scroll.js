$(document).on('ready', function() {
  var start = 0;
  var loading = false;
  var complete = false;
  $(window).on('scroll', function() {
      if($(window).scrollTop() + $(window).height() >= $('.books').position().top + $('.books').innerHeight()) {
          if (complete) return;
          loading = true;
          start += 20;
          $.get('/load-books/' + start, function(result) {
            console.log(result)
            if (!result.length) return complete = true;
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
