// import 'package:fitbit/features/auth/presentation/state/auth_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authViewModelProvider =
//     StateNotifierProvider<AuthViewModel, AuthState>((ref) {
//   return AuthViewModel(
//     ref.read(authUseCaseProvider),
//   );
// });

// class AuthViewModel extends StateNotifier<AuthState> {
//   final AuthUseCase _authUseCase;

//   AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

//   Future<void> registerStudent(UserEntity user) async {
//     state = state.copyWith(isLoading: true);
//     var data = await _authUseCase.registerStudent(user);
//     data.fold(
//       (failure) => state = state.copyWith(
//         isLoading: false,
//         error: failure.error,
//       ),
//       (success) => state = state.copyWith(
//         isLoading: false,
//         error: null,
//       ),
//     );
//   }

//   Future<bool> loginUser(String username, String password) async {
//     state = state.copyWith(isLoading: true);
//     bool isLogin = false;
//     var data = await _authUseCase.loginUser(username, password);
//     data.fold(
//       (failure) =>
//           state = state.copyWith(isLoading: false, error: failure.error),
//       (success) {
//         state = state.copyWith(isLoading: false, error: null);
//         isLogin = success;
//       },
//     );

//     return isLogin;
//   }
// }
