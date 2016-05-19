var keystone = require('keystone');
var Book = keystone.list('Book');
var Joi = require('joi');

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

var validationSchema = Joi.object().keys({
    name: Joi.string().required().options({ language: { any: { empty: 'must be filled in' }, label: 'Name' } }),
    title: Joi.string().required().options({ language: { any: { empty: 'must be filled in' }, label: 'Title' } }),
    author: Joi.string().allow(''),
    dedication: Joi.string().max(100).required().options({ language: { any: { empty: 'must be filled in', }, label: 'Dedication' } })
});

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

		locals.formData = {
			name: req.body.name,
			title: req.body.title,
			author: req.body.author,
			dedication: req.body.dedicaton,
		}

		Joi.validate(req.body, validationSchema, { abortEarly: false }, function (errors, value) { 
			if (errors) {
				for (var i = 0; i < errors.details.length; i++) {
					req.flash('error', errors.details[i].message);
				}
				return next();
			}

			req.body.lastUpdated = Date.now();
					
			updater.process(req.body, {
				fields: 'title, author, dedication, name, lastUpdated',
				flashErrors: 'true'
			}, function(err, item, other) {
				if (err) {
					locals.validationErrors = err.errors;
				} else {
					locals.bookAdded = true;			
				}
				next();
			});
		});

	});

	view.render('add-book');
	
};
