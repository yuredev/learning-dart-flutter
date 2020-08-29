main(List<String> args) {
  // usando função com parametros nomeados
  sayWhoAmI(age: 19, name: 'Luffy', height: 1.70);

  // para salvar uma função em variável 
  int Function(int, int) cloneDeSubtrair = subtrair;

  // por inferencia
  var clone = subtrair;

  print(clone(10, 5));

  // funções anonimas em Dart
  double Function(double, double) calcularForca = (massa, aceleracao) {
    return massa * aceleracao;
  };

  // por inferencia func recebe uma função de retorno inteiro
  var func = (int a, int b) {
    return a * b;
  };

  // arrow function 
  // em Dart só se usa a arrow em funções de linha única
  var adicao = (int a, int b) => a+b; 

  print('adicao de 34 + 6 = ${adicao(34, 6)}');

  // a forma sem inferencia é
  int Function(int, int) somar = (a,b) => a+b;


  print('somar = ${somar(24, 6)}');

  print('força: ${calcularForca(52, 100)} Newtons');

  print(cloneDeSubtrair(10, 5));
}

int subtrair(int a, int b) {
  return a - b;
}


// ao não colcoar tipos de retorno a função retorna um dynamic
funcao() {
  return 'exemplo';
}

// ao não colcoar o tipo do parametro ele será dynamic
void funcao2(a, b) {
  // a, b são dynamics
  print(a);
  print(b);
}

String concatNumWithString(String a, int b) {
  return '$a$b';
}

// parametros opcionais e padrão
// ao não receberem parametros colocan os valores por padrão
double multiplicar([double a = 0, double b = 0]) {
  return a*b;
}

// parametros nomeados
void sayWhoAmI({ String name, int age, double height}) {
  print("I'm $name, i'm $age years old, i'm $height of height");
}