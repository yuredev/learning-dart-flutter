main(List<String> args) {
  print(funcao(5)(10, 20));
}

// funcao que retorna funcao
int Function(int, int) funcao(int c) {
  return (a, b) => a+b+c; 
}