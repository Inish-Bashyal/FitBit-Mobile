import 'package:equatable/equatable.dart';
import 'package:fitbit/features/auth/data/model/auth_api_model.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/workout/data/model/workout_api_model.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_api_model.g.dart';

final routineApiModelProvider = Provider<RoutineApiModel>(
  (ref) => RoutineApiModel.empty(),
);

@JsonSerializable()
class RoutineApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? routineId;
  final AuthApiModel? user;
  final WorkoutApiModel? workout;
  final String routineStatus;
  final String enrolledAt;
  final String completedAt;

  const RoutineApiModel({
    this.routineId,
    this.user,
    this.workout,
    required this.routineStatus,
    required this.enrolledAt,
    required this.completedAt,
  });
  RoutineApiModel.empty()
      : routineId = '',
        user = AuthApiModel.empty(),
        workout = const WorkoutApiModel.empty(),
        routineStatus = '',
        enrolledAt = '',
        completedAt = '';

  factory RoutineApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineApiModelToJson(this);

  // Convert API Object to Entity
  RoutineEntity toEntity() => RoutineEntity(
        routineId: routineId,
        user: UserEntity(
          userID: user!.userID,
          age: user!.age,
          email: user!.email,
          firstname: user!.firstname,
          gender: user!.gender,
          lastname: user!.lastname,
          password: user!.password,
          username: user!.username,
        ),
        workout: WorkoutEntity(
          workoutId: workout!.workoutId,
          day: workout!.day,
          nameOfWorkout: workout!.nameOfWorkout,
          numberOfReps: workout!.numberOfReps,
          title: workout!.title,
        ),
        routineStatus: routineStatus,
        enrolledAt: DateTime.parse(enrolledAt),
        completedAt:
            completedAt.isNotEmpty ? DateTime.parse(completedAt) : null,
      );

  // Convert Entity to API Object
  RoutineApiModel fromEntity(RoutineEntity entity) => RoutineApiModel(
        routineId: entity.routineId,
        user: AuthApiModel(
          userID: entity.user!.userID,
          age: entity.user!.age,
          firstname: entity.user!.firstname,
          lastname: entity.user!.lastname,
          gender: entity.user!.gender,
          username: entity.user!.username,
          password: entity.user!.password,
          email: entity.user!.email,
        ),
        workout: WorkoutApiModel(
          workoutId: entity.workout!.workoutId,
          day: entity.workout!.day,
          nameOfWorkout: entity.workout!.nameOfWorkout,
          numberOfReps: entity.workout!.numberOfReps,
          title: entity.workout!.title,
        ),
        routineStatus: entity.routineStatus,
        enrolledAt: entity.enrolledAt.toIso8601String(),
        completedAt: entity.completedAt?.toIso8601String() ?? '',
      );

  // Convert API List to Entity List
  List<RoutineEntity> toEntityList(List<RoutineApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [routineId, routineStatus, completedAt, enrolledAt, user];
}
