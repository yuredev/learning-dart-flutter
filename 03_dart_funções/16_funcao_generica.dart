// podemos criar funções que podem receber parametros de qualquer tipo
// ou seja a função vira do tipo inteiro qundo mandamos tipos inteiros, strings quando strings etc.
// para isso devemos colocar o <> depois do nome da função para marcar aquela função como generica

void main(List<String> args) {

  List<int> list = [10, 20, 30, 40, 50];

  // a callback do segundo parametro automaticamente vira do tipo inteiro uma vez que
  // a lista mandada é do tipo inteiro o que faz com que o retorno 
  // e o primeiro parametro sejam listas de inteiro 
  // isso acontece pois esse map é uma funcao generica
  // que varia de acordo com o parametro enviado
  List<int> newList = map(list, (item) => item);
  
  print('lista de inteiros original: $list');
  print('lista de inteiros nova: $newList');

  List<String> listStrings = ['Sekiro', 'Genichiro', 'Owl', 'Ishin Ashina'];
  
  // usando a funcao generica porem com uma lista de Strings
  // o que faz com que a callback mandada receba e retorne uma lista de strings
  List<String> newListStrings = map(listStrings, (item) => item.toUpperCase());

  print('lista de strings original: $listStrings');
  print('lista de strings nova: $newListStrings');
}

// essa implementação do map é genérica
// ou seja se passado uma lista de strings 
// o retorno será uma lista de strings nova 
// se do tipo double
// lista de doubles nova
// 'E' significa o tipo genérico 
// mas poderia ser qualquer letra
List<E> map<E>(List<E> list, E Function(E) callback) {
  List<E> newList = [];
  for (E item in list) {
    newList.add(callback(item));
  };
  return newList;
}