'use strict';

// TODO DONE make it pass an event emitter function to lambda
// TODO DONE kill lambda after TTL expire
// TODO make event emitter submit data
// TODO walk through array of events and fork new process with event as first argument
// TODO don't fork if it exceeds given limit
// TODO hard code default values for LIMIT and TTL values

let myFn = require('./fn');
let cluster = require('cluster');
let cap = parseInt(process.env.LIMIT);
let ttl = parseInt(process.env.TTL);

let events = [{
	foo: 'bar'
},{
	foo: 'bar'
},{
	foo: 'bar'
},{
	foo: 'bar'
},{
	foo: 'bar'
},{
	foo: 'bar'
}];

function emitter (event, bla){
	process.send({
		event: event,
		msg: bla
	});
}

if (cluster.isMaster) {

	console.log(`Master ${process.pid} is running`);

	// for (let i = 0; i < cap; i++) {
	// 	cluster.fork();
	// }

	for (let i = 0; i < events.length; i++) {
		let worker = cluster.fork();
		worker.process.send(events[i]);
	}

	cluster.on('exit', (worker, code, signal) => {
		console.log(`worker ${worker.process.pid} died`);
		// TODO check if we are under fork limit and can fork another worker
	});

	cluster.on('message', (worker, msg)=>{
		console.log('incoming message...');
		console.log(`worker: ${worker.process.pid}`);
		console.log(msg);
	})

} else {

	console.log(`Worker ${process.pid} started`);
	process.on('message', (msg)=>{
		// kill process after timeout
		setTimeout(()=>{
			process.exit(0);
		}, ttl);

		console.log('Worker incoming message...');
		console.log(msg);
		console.log(myFn(emitter, 'WORLD!!!'));

	});

}

