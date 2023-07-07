import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';

class WorkoutState {
  final bool isLoading;
  final List<WorkoutEntity> workouts;
  final List<UserEntity>? users;
  final String? error;
  final String? image;

  WorkoutState({
    this.users,
    required this.isLoading,
    required this.workouts,
    this.error,
    this.image,
  });

  factory WorkoutState.initial() {
    return WorkoutState(
      isLoading: false,
      users: [],
      workouts: [],
      image: null,
    );
  }

  WorkoutState copyWith({
    bool? isLoading,
    List<WorkoutEntity>? workouts,
    List<UserEntity>? users,
    String? error,
    String? image,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      workouts: workouts ?? this.workouts,
      users: users ?? this.users,
      error: error ?? this.error,
      image: image ?? this.image,
    );
  }
}
