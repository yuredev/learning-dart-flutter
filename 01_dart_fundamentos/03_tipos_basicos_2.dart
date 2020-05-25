// List
// Set
// Map
import 'dart:io';

main() {

  // Lists

  // listas são como arrays em JavaScript
  List produtos = ['Caneta', 'Guitarra', 'Boné', 'Relógio'];
  print(produtos);

  // duas formas de acessar um elemento específico
  print(produtos.elementAt(1)); // Guitarra
  print(produtos[1]); // Guitarra

  // print(produtos[4]); // isso resulta em erro diferente do js que daria undefined

  // podem também ser atribuidos por inferencia
  var pessoas = ['Geralt', 'Dragonborn', 'Chosen Undead'];
  print(pessoas is List); // resultado será true
  
  // o is é o como se fosse o typeof do JavaScript 
  // mas funcionando para comparar se o tipo de algo é igual à algo
  print(34.3 is int); // resultado será false 

  // Maps

  // object literals do js são Maps no Dart
  // no Dart colocamos valores na chave podendo ser strings ou numeros 
  Map jogo = {
    'Nome': 'Skyrim',
    'Categoria': 'RPG',
    23: 'número 23'
  };

  print('isso é um Map? ' + ({
    'key': 'value'
  } is Map).toString());

  print(jogo);
  print(jogo is Map); //true
  print(jogo['Nome']); // Skyrim
  print(jogo['Categoria']); // RPG
  print(jogo[23]); // número 23
  print(jogo.values); // imprime somente valores
  print(jogo.keys); // imprime somente chaves
  print(jogo.entries); // chaves e valores

  // Sets
  // são estruturas de dados que representam os conjuntos da matemática
  // não aceitam repetição
  var times = {'Corinthians', 'Grêmio', 'Athletico PR', 'ABC FC'};
  print(times is Set); // true
  print({1, 2} is Set); // true
  // print(times[0]); // isso não dá certo porque Sets não são indexados

  // os sets são automaticamente do tipo dynamic se colocados como abaixo  
  Set timesBR = {'Corinthians', 'Flamengo', 'São Paulo', 'Santos'};
  Set timesArg = {'River Plate', 'San Lorenzo', 'Indepiendete'};

  var timesSulamericanos = timesBR.union(timesArg);
  print(timesSulamericanos is Set); // true

  print('\nTimes america do sul:' + timesSulamericanos.toString());
  print(timesSulamericanos.contains('Chelsea')); // false

  // conjunto somente de ints por inferencia
  var conjunto = {1,2,3,4,5};
  conjunto.add(2);
  conjunto.add(4);
  // conjuntos não aceitam repetição 
  // o 2 e 4 colocados foram desprezados
  print(conjunto.length == 5); // true
}