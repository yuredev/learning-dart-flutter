main() {
  // variáveis são tipadas assim como no C
  int number = 70;

  // print imprime na tela 
  print('hello world');

  // strings podem ser marcadas com aspas simples ou duplas
  String nome = "yure";
  print('meu nome é ' + nome);

  // blocos podem ser definidos ainda que não tenham nenhum propósito
  {
    // esses pontos e vírgulas não resultam em erros de código 
    ;
    ;
    ;
    print('dentro do bloco');
  }  

  // operador ternário
  print(number > 50 ? 'maior que 50' : 'não é maior que 50');

  // executando função
  printSoma(5,4);
}

void printSoma(int a, int b) {
  print(a+b);
}