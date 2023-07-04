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

  @override
  List<Object?> get props => [
        userID,
        firstname,
        lastname,
        image,
        age,
        gender,
        email,
        username,
        password
      ];

  const UserEntity({
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

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        userID: json["userID"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        image: json["image"],
        gender: json["gender"],
        age: json["age"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "firstname": firstname,
        "lastname": lastname,
        "image": image,
        "age": age,
        "gender": gender,
        "email": email,
        "username": username,
        "password": password,
      };
}
