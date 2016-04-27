var keystone = require('keystone');
var Book = keystone.list('Book');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// Set locals
	locals.section = 'add-book';

	view.on('post', function(next) {
		debugger; 

		var bookModel = new Book.model(),
			updater = bookModel.getUpdateHandler(req);

		updater.process(req.body, {
			fields: 'title'
		}, function(err) {
			locals.enquirySubmitted = true;
			if (err) {
				console.log(err.errors)
				locals.validationErrors = err.errors;
			} else {
				locals.bookAdded = true;
			}
			next();
		})
	});

	view.render('add-book');
	
};
