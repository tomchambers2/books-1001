var keystone = require('keystone');
var Book = keystone.list('Book');

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	
	view.on('post', function(next) {
		Book.model.findOne({
			email: req.body.email
		}).exec(function(err, result) {
			res.locals.book = result;

			return next(err);
		});
	});

	view.on('init', function(next) {
		if (req.query.password != "empathy") {
			return res.sendStatus(401);
		}

		return next();
	})

	view.render('link-by-email');
	
};
