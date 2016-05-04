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

			//send email to user with token link
		}
	});
}