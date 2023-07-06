import 'package:dartz/dartz.dart';
import 'package:fitbit/core/failure/failure.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/workout/data/data_source/workout_remote_data_source.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/domain/repository/workout_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutRemoteRepoProvider = Provider<IWorkoutRepository>(
  (ref) => WorkoutRemoteRepositoryImpl(
    workoutRemoteDataSource: ref.read(workoutRemoteDataSourceProvider),
  ),
);

class WorkoutRemoteRepositoryImpl implements IWorkoutRepository {
  final WorkoutRemoteDataSource workoutRemoteDataSource;

  WorkoutRemoteRepositoryImpl({required this.workoutRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addWorkout(WorkoutEntity workout) {
    return workoutRemoteDataSource.addWorkout(workout);
  }

  @override
  Future<Either<Failure, List<WorkoutEntity>>> getAllWorkouts() {
    return workoutRemoteDataSource.getAllWorkouts();
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsersByWorkout(
      String workoutId) {
    return workoutRemoteDataSource.getAllUserByWorkout(workoutId);
  }
  @override
  Future<Either<Failure, bool>> deleteWorkout(String id) {
    return workoutRemoteDataSource.deleteWorkout(id);
  }
}
