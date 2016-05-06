var request = require('supertest');
var start = require('../keystone');

describe('book functions', function() {
	var app;

	before(function(done) {
		app = start();

		//start db
		done();
		// console.log(app)
	});

	after(function() {
		//stop app
		//drop test collections
	});

	describe('/create-user', function() {
		it('creates a new book on valid post request to /create-user', function(done) {
			request(app)
				.post('/create-user')
				.field('secret', process.env.API_SECRET)
				.field('email', 'a.fake.email@gmail.com')
				.expect(200, done)

			// test that an email is sent
		});

		it('fails if api secret is invalid', function(done) {
			request(app)
				.post('/create-user')
				.field('secret', 'blah')
				.expect(401, done)
		});

		it('fails if a duplicate email address is used', function(done) {
			request(app)
				.post('/create-user')
				.field('secret', process.env.API_SECRET)
				.field('email', 'a.fake.email@gmail.com')
				.expect(400, done)			
		});

		it('fails if an invalid or no email address is used', function(done) {
			request(app)
				.post('/create-user')
				.field('secret', process.env.API_SECRET)
				.field('email', 'notanemail')
				.expect(400, done)	
		});
	});

	describe('/add-book', function() {
		var token;

		it('returns an error when a token that does not exist is used', function(done) {
			request(app)
				.get('/add-book/1234567890123456')
				.expect(404, done);
		});

		it('returns a validation error if any field except author is missing from form', function() {
			request(app)
				.post('/add-book/' + token)
				.body({
					title: 'A book',
					author: 'A man',
					dedication: 'I like it'
				})
				.expect(200);
		});		

		it('updates the book when a user provides valid data at /add-book', function() {
			request(app)
				.post('/create-user')
				.field('secret', process.env.API_SECRET)
				.field('email', 'a.fake.email@gmail.com')
				.expect(200, done)

			//get latest token
			// token = result.token;

			request(app)
				.post('/add-book/' + token)
				.body({
					title: 'A book',
					author: 'A man',
					name: 'the giver',
					dedication: 'I like it'
				})
				.expect(200);

				//check its in the db
		});

		it('returns an error when a token is used for a book with a title', function() {
			request(app)
				.post('/add-book/' + token)
				.body({
					title: 'A book',
					author: 'A man',
					name: 'the giver',
					dedication: 'I like it'
				})
				.expect(400);			
		});
	});

	describe('/book', function() {
		it('gets a book by valid number', function() {
			request(app)
				.get('/1')
				.expect(200);
		});

		it('returns 404 for an invalid book number', function() {
			request(app)
				.get('/9999999')
				.expect(404);
		});

		it('displays lists of comments on book page', function() {
			request(app)
				.get('/1')
				.expect(200);
		});

		it('rejects an empty or otherwise invalid comment', function() {

		});

		it('rejects a comment with an invalid email', function() {

		});

		it('accepts a new comment with a location on a book page', function() {

		});

		it('generates a token and sends an email when a new comment is posted', function() {

		});

		it('confirms and displays a comment when confirm link is followed', function() {

		});
	});

	describe('/recover', function() {
		it.skip('returns message and sends email if existing email entered', function() {

		});

		it.skip('returns message and but does not send email if non-existing email entered', function() {
			
		});		
	});

	describe('/export', function() {
		it.skip('exports a file according to specification', function() {

		});
	});
});