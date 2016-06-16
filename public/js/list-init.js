$(document).on('ready', function() {
  var options = {
    valueNames: ['title','number','author','name'],
    listClass: 'books',
    item: 'book-item'
  };

  var booksList = new List('books-list', options);
});
