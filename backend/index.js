
const app = require('express')();
const server = require('http').createServer(app);

const io = require('socket.io')(server);
const model = require('./model.js')

const morgan = require('morgan');

app.use(morgan('short'));
server.listen(3000, function (err) {
	console.log('server start at 3000')
});

let count = 0
io.on('connection', function(client){
	count ++
  client.on('login', async data => {
    // const connection = client.request.connection.remoteAddress.replace('::ffff:', '')
    // const connection = client.request.connection
    // console.log(connection)
    client.id = data.id
    const doc = await model.findOne({count: data.id})
    // console.log('login', count, client.id, data.id, doc.nanoid)
    client.emit('resNanoId', doc.nanoid)
  });
  client.on('disconnect', function(){
  	count --
	  console.log('disconnect: ', count, client.id)
  });
})

app.get('/dbCount', async (req, res) => {
  console.log(req.headers)
  res.json({count: await model.count()})
})
