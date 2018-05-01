const mongoose = require('mongoose')

const conn = mongoose.createConnection('mongodb://172.11.0.10:27017/shangTec', {
	user: '',
	pass: '',
	autoIndex: false, // Don't build indexes
	reconnectTries: Number.MAX_VALUE, // Never stop trying to reconnect
	reconnectInterval: 500, // Reconnect every 500ms
	poolSize: 10, // Maintain up to 10 socket connections
	bufferMaxEntries: 0
})

conn.on('open', function() {
	console.log("mongodb open: ", `172.11.0.10:27017`);
})

conn.on('error', function(err) {
	console.log("mongodb error: ", err);
})

const schema = new mongoose.Schema({
	nanoid: {type: String, index: true},
	count: {type: Number, index: true}
})
const model = conn.model('blog', schema)
module.exports = model