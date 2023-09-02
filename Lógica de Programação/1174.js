var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var A = new Array(100);

//lendo os valores para o vetor A

for (var i = 0; i < 100; i++){
    A[i] = parseFloat(lines.shift())
}

//verificar e imprimir os valores < = 10

for(var i = 0; i <100; i++){
    if (A[i]<=10){
        console.log(`A[${i}] = ${A[i].toFixed(1)}`);
    }
}