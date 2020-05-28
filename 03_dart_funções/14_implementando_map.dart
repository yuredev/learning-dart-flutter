main(List<String> args) {
  List<double> list = [10, 14, 20, 16, 24];
  print('lista original: $list');
  List<double> newList = map(list, (item) => item * 2);
  print('nova lista: $newList');
}

// function to transform all elements in a List
// inspired in the map method of Arrays in JavaScript
List<double> map(List<double> list, double Function(double) callback) {
  List<double> newList = [];
  for (double item in list) {
    newList.add(callback(item));
  };
  return newList;
}