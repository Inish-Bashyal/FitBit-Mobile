import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return AuthApiModel(
    firstname: '',
    lastname: '',
    email: '',
    age: '',
    gender: '',
    username: '',
    password: '',
  );
});

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userID;
  final String firstname;
  final String lastname;
  final String? image;
  final String email;
  final String age;
  final String gender;
  final String username;
  final String? password;

  AuthApiModel({
    this.userID,
    required this.firstname,
    required this.lastname,
    this.image,
    required this.age,
    required this.email,
    required this.gender,
    required this.username,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // convert AuthApiModel to AuthEntity
  UserEntity toEntity() => UserEntity(
        userID: userID,
        firstname: firstname,
        lastname: lastname,
        image: image,
        gender: gender,
        age: age,
        email: email,
        username: username,
        password: password ?? '',
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<AuthApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel(id: $userID, fname: $firstname, lname: $lastname, image: $image, gender: $gender, age: $age, email: $email, username: $username, password: $password)';
  }
}
