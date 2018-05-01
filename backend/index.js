
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
  client.on('event', function(data){
  	console.log(data)
  });
  client.on('disconnect', function(){
  	count --
	console.log('disconnect: ', count)
  });
})

app.get('/dbCount', async (req, res) => {
  res.json({count: await model.count()})
})
