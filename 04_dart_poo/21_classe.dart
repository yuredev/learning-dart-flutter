main(List<String> args) {

  Data dataAniversario = new Data();

  // atributos não tem encapsulamento
  dataAniversario.dia = 26;
  dataAniversario.mes = 5;
  dataAniversario.ano = 2000;
  print(dataAniversario);

  // o new no Dart é opcional
  // com ou sem ele o objeto é instanciado
  Data natal = Data(25, 12, 2020);
  print(natal);

  Data anoNovo = Data.nomeado(dia: 1, mes: 1, ano: 2021);
  Data vacinaCovid = Data.nomeado2();
  print(vacinaCovid);
  print(anoNovo);
} 

class Data {
  // atributos de forma normal não tem encapsulamento
  int dia;
  int mes;
  int ano;
  // pra deixálos privados seria necessário escrever 
  // int _dia;
  // int _mes;
  // int _ano;
  // isso faria com que esse atrubutos não fosse visíveis para
  // arquivos externos

  // em Dart só é possível ter 1 construtor 
  // construtor
  // Data([dia, mes, ano]){
  //   this.dia = dia;
  //   this.mes = mes;
  //   this.ano = ano;
  // }

  // a sintaxe à cima pode ser simplificada com 
  Data([this.dia, this.mes, this.ano]); 

  // construtor nomeado 
  // é possível usar construtores alternativos e nomeados
  Data.nomeado({this.dia, this.mes, this.ano});

  // construtor nomeado 
  // é possível usar construtores alternativos e nomeados
  Data.nomeado2({this.dia = 16, this.mes = 8, this.ano = 2020});


  // no Flutter tem um recurso adicional de utilizar construtores nomeados obrigatorios 
  // usando o required
  // é possível tambem usar valoes obrigatorios nomeados ex:
  // Data.nomeadoObrigatorio({
  //   @required this.dia, 
  //   @required this.mes, 
  //   @required this.ano
  // });


  // o this.ano no argumento, faz com que: this.ano = ano automaticamente
  Data.ultimoDiaDoAno(this.ano) {
    dia = 32;
    mes = 12;
  }

  @override
  String toString() {
    return '$dia/$mes/$ano';
  }
}