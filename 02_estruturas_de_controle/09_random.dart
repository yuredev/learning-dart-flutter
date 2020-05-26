// para usar o Random precisamos do dart:math
import 'dart:math';

main(List<String> args) {
  // vai de 0 a 10
  int nota = Random().nextInt(11);
  print('tirou $nota');
  print(nota >= 7 ? 'passou' : 'reprovou');
}