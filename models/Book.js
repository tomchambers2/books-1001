var keystone = require('keystone');
var autoIncrement = require('mongoose-auto-increment');
var Types = keystone.Field.Types;

console.log(keystone.mongoose)

autoIncrement.initialize(keystone.mongoose.connections[0]);

var Book = new keystone.List('Book');

Book.add({
	number: { type: Types.Number, required: true, index: true, initial: 1 },
	title: { type: Types.Text, required: true, index: true, initial: "", note: 'boobs' },
	dedication: { type: Types.Text },
	image: { type: Types.CloudinaryImage },
	location: { type: Types.Location }
});

Book.schema.plugin(autoIncrement.plugin, { model: 'Book', field: 'number' });

Book.register();