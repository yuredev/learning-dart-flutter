// mixins são estruturas que servem para 
// colocarem blocos de código dentro de 
// classes sem precisar herdar 
// para uma classe usar um mixin usa-se a palavra 
// 'with'

// mixins são úteis pois no Dart não há como herdar 
// 2 ou mais classes 
// assim para inserir mais códigos usamos o with 

main() {
  var frankSinatra = Pessoa('Sinatra', 'Tenor');
  frankSinatra.cantar();
  var sabia = Passaro('Sabia', 'Agudo');
  sabia.cantar();
}

class Pessoa with Cantor{
  String nome;

  Pessoa(String nome, String tom) {
    this.nome = nome;
    this.tomDaVoz = tom; // vem do mixin Cantor
  }
}

class Passaro with Cantor {
  String especie;

  Passaro(String especie, String tom) {
    this.especie = especie;
    this.tomDaVoz = tom; // vem do mixin Cantor
  }
} 

mixin Cantor {
  String tomDaVoz;

  void cantar() {
    print('Cantando no tom $tomDaVoz');
  }
}