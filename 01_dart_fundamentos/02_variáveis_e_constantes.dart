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

  // há também as constantes definidas por const
  const constante = 24;

  // a diferença entre a const e a final é que a const é em tempo de compilação e a final tempo de execução
  // ou seja o valor de const é atribuído assim que o programa for executado
  // o valor das finals é atribuído no momento que aquele código executar, ou seja, tempo de execução
  // constantes só podem receber valores diretos ou valores de outras constantes 

  int numero = 50;
  String palavra = 'any word';
  bool boleana = true;
  double flutuante = 23.5;

  // para concatenar strings com numeros 
  // basta usar o método toString do numero
  print('minha idade é ' + 19.toString());
  print('a soma entre 4 e 5 é ' + (4+5).toString());
}