var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

// Ler a quantidade de pares de valores (N)
const N = parseInt(lines.shift());

// Loop para ler e calcular os resultados para cada par de valores
for (let i = 0; i < N; i++) {
  const valores = lines[i].split(' ');
  const X = parseInt(valores[0]);
  const Y = parseInt(valores[1]);

  // Verifica se a divisão é possível (Y não pode ser zero)
  if (Y !== 0) {
    const resultado = (X / Y).toFixed(1);
    console.log(resultado);
  } else {
    console.log('divisao impossivel');
  }
}

