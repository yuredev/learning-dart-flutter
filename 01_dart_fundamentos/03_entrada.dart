// biblioteca para usar a leitura do teclado
import 'dart:io';

main() {
  // readFileSync aguarda a leitura do teclado
  // assim como scanf
  final String texto = stdin.readLineSync();
  print('valor digitado é ' +texto);

  // o readLineSync por lê strings 
  // assim temos que convertêlo para o tipo que quiseros
  // usando o método parse do tipo que quisermos exemplo: 
  // double.parse
  print('digite o primeiro numero: ');
  int numero1 = int.parse(stdin.readLineSync());
  print('digite o segundo  numero: ');
  int numero2 = int.parse(stdin.readLineSync());
  print('soma = ' + (numero1+numero2).toString());

  // a função print sempre pula linha
  // para não pular podemos usar o método write de stdout da lib dart:io
  stdout.write('informe o valor da constante: ');
  final double constante = double.parse(stdin.readLineSync()); 
  print('o valor da constante digitado é: ' + constante.toString());
}