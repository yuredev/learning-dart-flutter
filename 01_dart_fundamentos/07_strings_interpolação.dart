main(List<String> args) {
  int idade = 20;
  String pais = 'Brazil';
  String nome = 'Yure';

  // interpolação no dart é com o $nomeDaVariavel

  // ela funciona com ambas formas de string '' e ""

  // sem interpolação
  print('meu nome é ' + nome + ', tenho ' + idade.toString() + ' anos, moro no ' + pais);

  // com interpoção
  print('meu nome é $nome, tenho $idade anos, moro no $pais');
  print("meu nome é $nome, tenho $idade anos, moro no $pais");

  // para usar o símbolo do dinheiro literal, basta usar a \
  print('o dolar está a quase 6,00 R\$');

  // em expressões númericas usamos o {}
  print('5 + 7 = ${5+7}');
}