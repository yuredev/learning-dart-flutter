import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_test/models/user_model.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: 'https://60e6fcc715387c00173e49e2.mockapi.io/api/')
abstract class UserService {
  
  factory UserService(Dio dio, { String baseUrl }) = _UserService;

  @GET('/users')
  Future<List<UserModel>> findAll();

}

