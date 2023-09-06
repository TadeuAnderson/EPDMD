var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');


function determinarVencedor(jogador1, jogador2) {
    if ((jogador1 === "ataque" && jogador2 === "pedra") ||
        (jogador1 === "pedra" && jogador2 === "papel") ||
        (jogador1 === "ataque" && jogador2 === "papel")) {
      return "jogador1";
    } else if ((jogador2 === "ataque" && jogador1 === "pedra") ||
               (jogador2 === "pedra" && jogador1 === "papel") ||
               (jogador2 === "ataque" && jogador1 === "papel")) {
      return "jogador2";
    } else if ((jogador1 === "papel" && jogador2 === "papel")){
        return "ambas";
    } else if ((jogador1 === "ataque" && jogador2 === "ataque")){
        return "aniquilação";
    }else {
      return "sem_ganhador";
    }
  }

  let N = lines.shift()
  if (N <=1000 ){
    for( let i = 1; i<= N; i++ ){
        const jogador1 = lines.shift()
        const jogador2 = lines.shift()
        const resultado = determinarVencedor(jogador1, jogador2);
        if (resultado === "jogador1") {
            console.log("Jogador 1 venceu");
        } else if (resultado === "jogador2") {
            console.log("Jogador 2 venceu");
        } else if (resultado === "ambas") {
            console.log("Ambos venceram");
        }else if (resultado === "aniquilação") {
            console.log("Aniquilacao mutua");
        }else {
            console.log("Sem ganhador");
        }
    }
  }
