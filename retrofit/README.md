# Retrofit

## Adicionar as dependências

```yaml
dependencies: 
  retrofit: 2.0.0
  json_serializable: 4.1.3
  dio: 4.0.0

dev_dependencies: 
  build_runner: 2.0.5
  retrofit_generator: 2.0.0+3
```

## Retrofit

Biblioteca para gerar códigos de consumo a API
por meio de anotações
Usa o DIO por debaixo dos panos

## DIO

Lib para requisições HTTP mais alto nível que o pacote
http do Dart

## Build Runner

O build runner fica ouvindo mudanças nos arquivos
e cria classes necessárias automaticamente.\
Se escrevermos uma interface e anotar os métodos, ele cria classes que implementam nossas interfaces

## Exemplos:

O código abaixo:
```dart
@RestApi(baseUrl: 'https://60e6fcc715387c00173e49e2.mockapi.io/api/')
abstract class UserService {
  
  factory UserService(Dio dio, { required String baseUrl }) = _UserService;


  @GET('/users')
  Future<List<UserModel>> findAll();

}


```

Gerará:

```dart
class _UserService implements UserService {
  _UserService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://60e6fcc715387c00173e49e2.mockapi.io/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<UserModel>> findAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

```