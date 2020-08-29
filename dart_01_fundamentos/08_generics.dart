main(List<String> args) {
  // quando usamos a lista normalmente sem colocar os generics
  // os aceitados na lista são por inferência, ou seja, só serão aceitos
  // valores iguais á algum dos tpos colocados no início
  // se colocarmos apenas de um tipo como no exemplo abaixo...
  var lista1 = [13, 43, 34, 23];

  // não poderemos colocar outra coisa senão numeros inteiros
  // lista1.add('string'); // isso não funciona
  // lista1.add(3.42); // isso não funciona

  // no entando se colocarmos...
  var lista2 = [2, 4, 5, 1.5]; // lista considerada do tipo num 
  // o trecho assim será por inferência List<num> lista2

  // toda lista na sintaxe abaixo colocada sem generic é do tipo dynamic
  List a = [23, 54, 46, 34.43]; // List<dynamic>
  // equivale á List<dynamic> a

  // lista de objetos por inferencia, aceita quaisquer valores
  var randomList = [23, 'Aeee', true, 3.14]; // List<Object>

  // é possível definir manualmente o tipo da lista
  List<String> times = ['Corinthians', 'Chelsea', 'Real Madrid'];

  // EM MAPS
  // no caso abaixo a as chaves serão sempre strings e os valroes sempre double
  Map<String, double> salarios = {
    'programador': 5500.20,
    'juiz': 30000.10,
    'porteiro': 2750.80
  };

}