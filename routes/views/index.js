var keystone = require('keystone');
var Book = keystone.list('Book');

exports = module.exports = function(req, res) {

	var view = new keystone.View(req, res);
	var locals = res.locals;

	// locals.section is used to set the currently selected
	// item in the header navigation.
	locals.section = 'home';

	view.on('init', function(next) {
		Book.model.find({
			title: { $exists: true, $ne: "" }
		})
		.sort('number')
		// .limit(20)
		.exec().then(function(result) {
			locals.books = result;
			next();
		}, function(err) {
			next(err);
		});
	});

	view.render('index');
};
