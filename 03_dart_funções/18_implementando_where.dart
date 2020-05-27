main(List<String> args) {
  List<String> words = ['Samsung', 'LG', 'Microsoft', 'Google', 'Asus', 'Apple'];

  bool Function(String) filterSmallWords = (word) => word.length < 6;

  List<String> smallWords = customWhere(words, filterSmallWords);
  print('palavras pequenas: $smallWords');

  List<int> numbers = [1, 3, 4, 50, 70, 23, 33, 99, 111];

  // filtrar por números ímpares
  // odd  -> ímpar em inglês
  var isOddNumber = (int number) => number % 2 != 0;

  List<int> oddNumbers = customWhere(numbers, isOddNumber);

  print('números ímpares: $oddNumbers');
}

List<E> customWhere<E>(List<E> list, bool Function(E) callback) {
  List<E> newList = [];
  
  for (E item in list) {
    if (callback(item)) {
      newList.add(item);
    }
  }
  return newList;
}