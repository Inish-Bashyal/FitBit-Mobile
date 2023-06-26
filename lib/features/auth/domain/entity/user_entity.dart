class UserEntity {
  final String? userID;
  final String firstname;
  final String lastname;
  final String? image;
  final String age;
  final String gender;
  final String email;
  final String username;
  final String password;

  UserEntity({
    this.userID,
    required this.firstname,
    required this.lastname,
    this.image,
    required this.age,
    required this.gender,
    required this.email,
    required this.username,
    required this.password,
  });
}
