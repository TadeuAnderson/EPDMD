var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var valor = parseInt(lines.shift())
var anos = parseInt(valor / 365)
var meses = parseInt((valor % 365) / 30)
var dias = parseInt((valor % 365) % 30)

console.log(`${anos} ano(s)`);
console.log(`${meses} mes(es)`);
console.log(`${dias} dia(s)`);