main(List<String> args) {
  // o for of do JavaScript
  // e o for (Object o : objects) do java
  // equivalem ao for in do Dart

  List<int> numeros = [34, 56, 57, 10, 23, 9];
  for (int numero in numeros) {
    print(numero);
  } 
  Map<String, double> notas = {
    'Naruto': 8,
    'Luffy': 10,
    'Goku': 9
  };
  // percorrendo as chaves
  for (var item in notas.keys) {
    print(item);
  }
  // percorrendo os valores
  for (var item in notas.values) {
    print(item);
  }
  // percorrendo as entradas 
  for (var item in notas.entries) {
    print('{ ${item.key}: ${item.value} }');
  }
}