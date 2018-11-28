'use strict';

console.log('fn init');

module.exports = function(emit, arg){

	emit('MY_EVENT', 'foo bar');

	return 'hello ' + arg;
};