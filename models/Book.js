var keystone = require('keystone');
var autoIncrement = require('mongoose-auto-increment');
var Types = keystone.Field.Types;

autoIncrement.initialize(keystone.mongoose.connections[0]);

var Book = new keystone.List('Book', {
	defaultSort: 'number'
});

Book.add({
	manualNumberAssign: { type: Types.Boolean, initial: true },
	number: { type: Types.Number, initial: true, dependsOn: { manualNumberAssign: true } },
	email: { type: Types.Email, initial: true, index: true, unique: true },
	token: { type: Types.Text },
	title: { type: Types.Text, initial: true },
	author: { type: Types.Text, initial: true },
	name: { type: Types.Text, initial: true },
	dedication: { type: Types.Textarea, initial: true },
	image: { type: Types.CloudinaryImage },
	realCover: { type: Types.CloudinaryImage },
	lastUpdated: { type: Types.Text }
});

Book.defaultColumns = 'number, title, author, name, email';

Book.schema.plugin(autoIncrement.plugin, { model: 'Book', field: 'number', startAt: 1, skipBy: 'manualNumberAssign' });

Book.register();
