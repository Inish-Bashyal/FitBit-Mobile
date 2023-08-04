import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';

class RoutineState {
  final bool isLoading;
  final List<RoutineEntity> routines;
  final List<UserEntity>? users;
  final String? error;

  RoutineState({
    this.users,
    required this.isLoading,
    required this.routines,
    this.error,
  });

  factory RoutineState.initial() {
    return RoutineState(
      isLoading: false,
      users: [],
      routines: [],
    );
  }

  RoutineState copyWith({
    bool? isLoading,
    List<RoutineEntity>? routines,
    List<UserEntity>? users,
    String? error,
  }) {
    return RoutineState(
      isLoading: isLoading ?? this.isLoading,
      routines: routines ?? this.routines,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
