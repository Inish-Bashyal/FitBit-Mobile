import 'package:fitbit/features/auth/domain/entity/user_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final List<UserEntity>? users;
  UserEntity? user;

  AuthState(
      {required this.isLoading,
      this.error,
      this.imageName,
      this.users,
      this.user});

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      imageName: null,
      users: [],
      user: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    List<UserEntity>? users,
    UserEntity? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      users: users ?? this.users,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
