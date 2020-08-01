main(List<String> args) {
  List<double> notas = [6.5, 7.5, 3.2, 9.8, 10, 2.9, 8.1];
 
  // o filter do js é o where do Dart
  var notasBoas = notas.where((nota) => nota >= 7);

  var notasMuitoBoas = notasBoas.where((nota) => nota >= 9);

  print(notasBoas);
  print(notasMuitoBoas);
}