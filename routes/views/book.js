var keystone = require('keystone');
var Book = keystone.list('Book');
var Comment = keystone.list('Comment');

exports = module.exports = function(req, res) {
	
	var view = new keystone.View(req, res);
	var locals = res.locals;
	
	// Set locals
	locals.section = 'book';



	view.on('post', function(next) {
		var comment = new Comment.model({
			confirmed: false,
			bookId: req.body.bookId
		});

		console.log(req.body)
	
		var handler = comment.getUpdateHandler(req);
		handler.process(req.body, {}, function(err) {
			if (err) {
				commentValidationErrors = err.errors;
				console.log(err.errors)
			} else {
				req.flash('success', 'Your comment was added.');
				locals.commentAdded = true;
			}
			next();
		});
		
	});

	view.on('init', function(next) {
		Book.model.findOne({
			number: req.params.number
		}).exec(function(err, result) {
			if (!result) {
				return res.status(404).send(keystone.wrapHTMLError('This book does not exist in our library'));
			}

			locals.book = result;

			Comment.model.find({
				bookId: result._id
			}).exec(function(err, result) {
				// if (err) ???
				locals.comments = result;
				console.log(result)
			})

			next(err);
		});
	});

	view.render('book');
};
