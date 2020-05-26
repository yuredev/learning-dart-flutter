main() {

  // esse final não impede que novos valores sejam colocados na lista
  // somente impede que seja atribuído outro valor para movies
  final List movies = ['Fight club', 'Avatar', 'Django'];
  movies.add('City of God'); // não resulta em erro
  print(movies);
  
  // se quisermos deixar os valroes de uma lista constantes podemos utilizar 
  final List games = const ['Skyrim', 'Dark Souls', 'Sekiro'];
  // games.add('God of War'); // isso resulta em erro. pois os valores da lista acima também são constantes

  // outra forma de deixarmos uma lista constante é usar o somente const ao invés do final
  // já que o const é usado em tempo de execução, não é possível nem adicionar valores à ele
  const List countries = ['Brazil', 'USA', 'England', 'Portugal', 'Italia'];
  // countries.add('China'); // resulta em erro
  // countries = ['India', 'Cuba'] // resulta em erro

  // é possível também declarar listas que não podem ser modificadas 
  // no entanto na variábel pode  ser atribúido outro valor ex:
  List languages = const ['JavaScript', 'Dart', 'C', 'Java'];
  print('lista antes: ' + languages.toString());

  // languages.add('Python'); // isso resulta em erro 

  languages = ['Rust', 'Python', 'PHP', 'Kotlin']; // isso não resulta em erro
  print('Lista depois: ' + languages.toString());
}