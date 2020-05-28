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
} 

class Data {
  // atributos não tem encapsulamento

  // construtor
  Data([dia, mes, ano]){
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }

  int dia;
  int mes;
  int ano;
  
  @override
  String toString() {
    return '$dia/$mes/$ano';
  }
}