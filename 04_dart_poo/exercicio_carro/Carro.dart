class Carro {
  int _velAtual;
  final int _velMaxima;
    
  Carro(this._velMaxima) {
    _velAtual = 0;
  }

  int acelerar() {
    if (_velAtual < _velMaxima - 5) {
      _velAtual += 5;
    } else {
      _velAtual = _velMaxima;
    }
    return _velAtual;
  }
  int frear() {
    if (_velAtual > 5) {
      _velAtual -= 5;
    } else {
      _velAtual = 0;
    }
    return _velAtual;
  }
  bool estaNoLimite() {
    return _velAtual == _velMaxima;
  }

  // gets e sets 
  // em sintaxes arrow e padrão

  int get velAtual {
    return this._velAtual;
  }

  int get velMaxima => _velMaxima;

  // void set velAtual(int velAtual) => _velAtual = velAtual;

  int valorAbsoluto(a, b) {
    return (a-b).abs();
  }

  void set velAtual(int velAtual) {
    if (valorAbsoluto(_velAtual, velAtual) <= 5) {
      this._velAtual = velAtual;
    } else {
      throw new Exception('Velocidade não permitida');
    }
  }

  // os métodos get e set são acessados como atributos 
  // diferente do Java onde o método é chamado

  // quando há um 'set idade' por exemplo

  // podemos usá-lo como objeto.idade = 33;
  // ao invés de objeto.setIdade(33); como é no Java

  // o get a mesma coisa
  // ao invés de objeto.getIdade() usamos objeto.idade

}