main(List<String> args) {
  List<double> notas = [4.5, 8.6, 6.9, 9.5, 8.4, 5.0];

  // o reduce do Dart é igual o do JS, a diferença é que ele não possui o último parametro
  // que no JS é o quanto que valor total começa
  double total = notas.reduce((total, current) => total + current);
  print(total);
}