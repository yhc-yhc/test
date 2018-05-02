
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
	console.log('connect: ', count)
  client.on('login', function(data){
    console.log('login', data)
  });
  client.on('queryNanoId', async data => {
    const doc = await model.findOne({count: data.count})
  	console.log('queryNanoId', data.count, doc.nanoid)
    client.emit('resNanoId', doc.nanoid)
  });
  client.on('disconnect', function(){
  	count --
	console.log('disconnect: ', count)
  });
})

app.get('/dbCount', async (req, res) => {
  res.json({count: await model.count()})
})
