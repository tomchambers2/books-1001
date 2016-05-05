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
				return next();
			}
			locals.book = result;
			locals.number = pad(result.number, 4);
			next();
		});
	})	

	view.on('post', function(next) {
		if (locals.invalidToken) return next();

		var updater = locals.book.getUpdateHandler(req);

		updater.process(req.body, {
			fields: 'title, author, dedication, name',
			flashErrors: true
		}, function(err, item, other) {
			console.log("item",item)
			console.log('other',other)
			if (err) {
				console.error(err.errors);
				locals.validationErrors = err.errors;
			} else {
				locals.bookAdded = true;

				new keystone.Email({
					templateExt: 'swig',
		    		templateEngine: require('swig'),
		    		templateName: 'book-added'
		    	}).send({
					to: locals.book.email,
					from: {
						name: 'A Thousand and One Books',
						email: 'contact@athousandandonebooks.com'
					},
					subject: 'Confirmation of your book being added to A Thousand and One Books',
					book: req.body.token
				}, function(err, res) {
					if (err) console.error(err);
				});				
			}
			next();
		});
	});

	view.render('add-book');
	
};
