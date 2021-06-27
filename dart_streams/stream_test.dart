// em streams colocamos o * a frente do async
// e usamos o yeld no lugar do return
Stream<int> sendDataStream() async* {
  for (var i = 0; i < 1000; i++) {
    print('Sending $i...');
    await Future.delayed(Duration(seconds: 2));
    yield i;
    await Future.delayed(Duration(seconds: 2));
  } 
}

void main() {
  final stream = sendDataStream();
  stream.listen((data) => print('Received: $data'));
}