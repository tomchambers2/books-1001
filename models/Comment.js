var keystone = require('keystone');
var Types = keystone.Field.Types;

var Comment = new keystone.List('Comment', {
	track: true
});

Comment.add({
	bookId: { type: Types.Text },
	token: { type: Types.Text },
	confirmed: { type: Types.Boolean },
	email: { type: Types.Email, required: true, initial: true },
	name: { type: Types.Text, required: true, index: true },
	body: { type: Types.Text, required: true, initial: false },
	location: { type: Types.Location }
});

Comment.register();
