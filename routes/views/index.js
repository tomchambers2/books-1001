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

	// locals.section is used to set the currently selected
	// item in the header navigation.
	locals.section = 'home';

	view.on('init', function(next) {
		Book.model.find({
			title: { $exists: true, $ne: "" }
		})
		.sort('number')
		// .limit(20)
		.exec().then(function(result) {
			for (var i = result.length - 1; i >= 0; i--) {
				result[i].paddedNumber = pad(result[i].number, 4);
			}
			locals.books = result;
			next();
		}, function(err) {
			next(err);
		});
	});

	view.render('index');
};
