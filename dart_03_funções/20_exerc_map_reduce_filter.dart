main(List<String> args) {
  var alunos = [
    {'nome': 'Geralt', 'nota': 9.0},
    {'nome': 'Dandelion', 'nota': 9.4},
    {'nome': 'Ciri', 'nota': 9.0},
    {'nome': 'Triss', 'nota': 9.2},
    {'nome': 'Yennefer', 'nota': 8.8}
  ];

  double somaDasNotas = alunos.map((e) => e['nota']) // o resultado desse map será um Iterable de Objects
    .map((e) => (e as double)) // desta forma precisamos converter esses Objects para doubles para o usar o operador +
    .reduce((acumulo, atual) => acumulo + atual);

  double mediaDasNotas = somaDasNotas / alunos.length;

  print(mediaDasNotas);
}