var randtoken = require('rand-token');
var keystone = require('keystone');
var Book = keystone.list('Book');

module.exports = function(req, res) {
	if (req.body.secret != process.env.API_SECRET) {
		return res.status(401).json({ errors: ["API secret was invalid"] });
	}

	var bookModel = new Book.model(),
	updater = bookModel.getUpdateHandler(req);

	req.body.token = randtoken.generate(16);

	updater.process(req.body, {
		fields: 'email, token'
	}, function(err) {
		if (err) {
			res.status(400).json({ errors: err.errors });
		} else {
			res.status(200).json({ success: true });

			new keystone.Email({
				templateExt: 'swig',
	    		templateEngine: require('swig'),
	    		templateName: 'user-created'
	    	}).send({
				to: req.body.email,
				from: {
					name: 'A Thousand and One Books',
					email: 'librarian@athousandandonebooks.com'
				},
				subject: 'Thank you for your donation to A Thousand and One Books',
				token: req.body.token
			}, function(err, res) {
				if (err) console.error(err);
			});			
		}
	});
}