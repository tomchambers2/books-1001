var keystone = require('keystone');
var autoIncrement = require('mongoose-auto-increment');
var Types = keystone.Field.Types;

autoIncrement.initialize(keystone.mongoose.connections[0]);

var Book = new keystone.List('Book');

Book.add({
	number: { type: Types.Number },
	email: { type: Types.Email, required: true, initial: true, index: true, unique: true },
	token: { type: Types.Text },
	title: { type: Types.Text, initial: true },
	dedication: { type: Types.Text, initial: true },
	image: { type: Types.CloudinaryImage }
});

Book.schema.plugin(autoIncrement.plugin, { model: 'Book', field: 'number', startAt: 1 });

Book.register();