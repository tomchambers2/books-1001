var keystone = require('keystone');
var Book = keystone.list('Book');

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);

	view.on('init', function(next) {
		Book.model.find({}).exec(function(err, books) {
			if (!books.length) {
				return res.status(404).send(keystone.wrapHTMLError('No books in database'));
			}
			if (err) {
				next(err);
			}

			var output = '';
			for (var i = 0; i < books.length; i++) {
				output += '"' + books[i].dedication + '"\n';
				output += 'Book #' + pad(books[i].number, 4) + '\n';
				output += 'Donated by... ' + books[i].name + '\n';
				output += '\n';
			}

			res.set({"Content-Disposition":"attachment; filename=\"1001booksexport.txt\""});
			res.send(output);
			
		});
	});

	view.render('book');
};
