var keystone = require('keystone');
var autoIncrement = require('mongoose-auto-increment');
var Types = keystone.Field.Types;

autoIncrement.initialize(keystone.mongoose.connections[0]);

var Book = new keystone.List('Book');

Book.add({
	number: { type: Types.Number, required: true, index: true, initial: 1, dropDups: true },
	title: { type: Types.Text, required: true, index: true, initial: "", note: 'boobs' },
	dedication: { type: Types.Text },
	image: { type: Types.CloudinaryImage },
	location: { type: Types.Location }
});

Book.schema.plugin(autoIncrement.plugin, { model: 'Book', field: 'number', startAt: 1 });

Book.register();