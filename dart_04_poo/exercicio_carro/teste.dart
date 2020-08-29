import './Carro.dart';
main(List<String> args) {
  Carro camaro = Carro(300);

  while(!camaro.estaNoLimite()) {
    print(camaro.acelerar());
  }

  try {
    camaro.velAtual = 400; // resulta em exception de dentro do set
  } catch (e) {
    print(e); 
  }

  camaro.velAtual = 298;

  while(camaro.velAtual > 0) {
    print(camaro.frear());
  }
}