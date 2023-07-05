import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';

class WorkoutState {
  final bool isLoading;
  final List<WorkoutEntity> workouts;
  final List<UserEntity>? users;
  final String? error;

  WorkoutState({
    this.users,
    required this.isLoading,
    required this.workouts,
    this.error,
  });

  factory WorkoutState.initial() {
    return WorkoutState(
      isLoading: false,
      users: [],
      workouts: [],
    );
  }

  WorkoutState copyWith({
    bool? isLoading,
    List<WorkoutEntity>? workouts,
    List<UserEntity>? users,
    String? error,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      workouts: workouts ?? this.workouts,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
