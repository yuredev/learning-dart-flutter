main(List<String> args) {
  print('numeros primos até 25');
  int divisores;
  for (int i = 1; i <= 25; i++) {
    divisores = 0;
    for (int j = 1; j <= i; j++) {
      if (i % j == 0) {
        divisores++;
      }
    }
    print(divisores == 2 ? '$i primo' : '$i não primo');
  }
}