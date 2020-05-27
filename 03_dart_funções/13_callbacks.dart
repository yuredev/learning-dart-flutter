import 'dart:math';

void main() {
  var fnPar = () => print('valor deu par');

  void Function() fnImpar = () {
    print('valor deu ímpar');
  };

  execute(fnImpar: fnImpar, fnPar: fnPar);
  execute2(() => print('valor deu par'), () => print('valor deu ímpar'));
  
  execute2(() {
    print('deu par pq eu quis q desse par');
  }, () {
    print('deu impar pq eu quis q desse impar');
  });
}
// com parametros nomeados 
void execute({Function fnPar, Function fnImpar}) {
  Random().nextInt(10) % 2 == 0 ? fnPar() : fnImpar();
}

// parametros não nomeados
void execute2(Function fnPar, Function fnImpar) {
  Random().nextInt(10) % 2 == 0 ? fnPar() : fnImpar();
}