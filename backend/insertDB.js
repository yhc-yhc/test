var nanoid = require('nanoid')
const model = require('./model.js')
global.Promise = require('bluebird')

async function main() {
	console.time('creatDB')
	for (let i = 0; i < 1000000; i++) {
		const rs = await model.create({
			nanoid: nanoid(),
			count: i + 1
		})
	}
	console.timeEnd('creatDB')
	process.exit(0)
}
main()