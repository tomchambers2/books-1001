var keystone = require('keystone');
var Book = keystone.list('Book');

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// Set locals
	locals.section = 'add-book';

	view.on('init', function(next) {
		Book.model.findOne({
			token: req.params.token,
			title: { $exists: false }
		}).exec(function(err, result) {
			if (!result) {
				locals.invalidToken = true;
			}
			locals.number = pad(result.number);
			next();
		});
	})	

	view.on('post', function(next) {
		if (locals.invalidToken) return next();

		var updater = locals.book.getUpdateHandler(req);

		updater.process(req.body, {
			fields: 'title'
		}, function(err) {
			locals.enquirySubmitted = true;
			if (err) {
				console.log(err.errors)
				locals.validationErrors = err.errors;
			} else {
				locals.bookAdded = true;

				//send confirmation email
			}
			next();
		});
	});

	view.render('add-book');
	
};
