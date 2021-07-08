import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  String id;
  String name;
  String email;
  String job;

  UserModel({
    required this.id,
    required this.email,
    required this.job, 
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}