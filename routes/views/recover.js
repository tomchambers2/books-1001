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
	
	view.on('post', function(next) {
		Book.model.findOne({
			email: req.body.email
		}).exec(function(err, result) {
			locals.recovered = true;

			if (!result) {
				console.error('Recover: failed to find email ' + req.body.email)
				return next();
			}

			new keystone.Email({
				templateExt: 'swig',
	    		templateEngine: require('swig'),
	    		templateName: 'recover'
	    	}).send({
				to: result.email,
				from: {
					name: 'A Thousand and One Books',
					email: 'librarian@athousandandonebooks.com'
				},
				subject: 'A reminder of your book number at A Thousand and One Books',
				book: result,
				number: pad(result.number, 4)
			}, function(err, res) {
				if (err) console.error(err);
			});

			return next(err);
		});
	})	

	view.render('recover');
	
};
