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
		Book.model.find({
			title: { $exists: true, $ne: "" }
		})
		.sort('lastUpdated')
		.exec(function(err, books) {
			if (!books.length) {
				return res.status(404).send({ success: false, message: 'No more books' });
			}
      res.json(books);
		});
	});

	view.render('book');
};
