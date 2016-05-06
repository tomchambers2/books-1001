var keystone = require('keystone');
var Book = keystone.list('Book');
var Comment = keystone.list('Comment');
var randtoken = require('rand-token');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// Set locals
	locals.section = 'book';

	view.on('post', function(next) {
		var token = randtoken.generate(16);

		var comment = new Comment.model({
			confirmed: false,
			bookId: req.body.bookId,
			token: token
		});

		req.body.location = {
			geo_lat: req.body.geo_location_lat,
			geo_lng: req.body.geo_location_lng
		}

		var handler = comment.getUpdateHandler(req);
		handler.process(req.body, {}, function(err) {
			if (err) {
				commentValidationErrors = err.errors;
				console.log(err.errors)
			} else {
				req.flash('success', 'Your comment was added.');
				locals.commentAdded = true;

				new keystone.Email({
					templateExt: 'swig',
		    		templateEngine: require('swig'),
		    		templateName: 'confirm-comment'
		    	}).send({
					to: req.body.email,
					from: {
						name: 'A Thousand and One Books',
						email: 'librarian@athousandandonebooks.com'
					},
					subject: 'Please confirm your comment on A Thousand and One Books',
					token: token
				}, function(err, res) {
					if (err) console.error(err);
				});				
			}
			next();
		});
		
	});

	view.on('init', function(next) {
		Book.model.findOne({
			number: req.params.number,
			title: { $exists: true }
		}).exec(function(err, result) {
			if (!result) {
				return res.status(404).send(keystone.wrapHTMLError('This book does not exist in our library'));
			}

			locals.book = result;

			Comment.model.find({
				bookId: result._id
			}).exec(function(err, result) {
				// if (err) ???
				console.log(result)
				locals.comments = result;

				next(err);
			})

		});
	});

	view.render('book');
};
