main() {
  // o Dart tem tipagem forte e pode ser dinámica ou estática
  
  // inferência dinámica
  var variavelNeutra = 'neutra';
 
  // depois assinalado o valor, mesmo que dinámicamanete a variável só pode receber daquele tipo
  // assim o trecho abaixo dará erro
  // variavelNeutra = 340;
  
  // constantes podem ou não usar a tipagem dinámica
  final double PI = 3.14;
  final gravidade = 9.8;
  // ambos os casos funcionam

  int numero = 50;
  String palavra = 'any word';
  bool boleana = true;
  double flutuante = 23.5;

  // para concatenar strings com numeros 
  // basta usar o método toString do numero
  print('minha idade é ' + 19.toString());
  print('a soma entre 4 e 5 é ' + (4+5).toString());
}