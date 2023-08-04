import 'package:equatable/equatable.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_api_model.g.dart';

final routineApiModelProvider = Provider<RoutineApiModel>(
  (ref) => const RoutineApiModel.empty(),
);

@JsonSerializable()
class RoutineApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? routineId;
  final UserEntity user;
  final WorkoutEntity workout;
  final String routineStatus;
  final String enrolledAt;
  final String completedAt;

  const RoutineApiModel({
    required this.routineId,
    required this.user,
    required this.workout,
    required this.routineStatus,
    required this.enrolledAt,
    required this.completedAt,
  });
  const RoutineApiModel.empty()
      : routineId = '',
        user = const UserEntity(
            firstname: '',
            lastname: '',
            age: '',
            gender: '',
            email: '',
            username: '',
            password: ''),
        workout = const WorkoutEntity(
            title: '', nameOfWorkout: '', numberOfReps: '', day: ''),
        routineStatus = '',
        enrolledAt = '',
        completedAt = '';

  Map<String, dynamic> toJson() => _$RoutineApiModelToJson(this);

  factory RoutineApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineApiModelFromJson(json);

  // Convert API Object to Entity
  RoutineEntity toEntity() => RoutineEntity(
      routineId: routineId,
      user: user,
      workout: workout,
      routineStatus: routineStatus,
      enrolledAt: enrolledAt,
      completedAt: completedAt);

  // Convert Entity to API Object
  RoutineApiModel fromEntity(RoutineEntity entity) => RoutineApiModel(
        routineId: entity.routineId ?? '',
        user: entity.user,
        workout: entity.workout,
        routineStatus: entity.routineStatus,
        enrolledAt: entity.enrolledAt,
        completedAt: entity.completedAt,
      );

  // Convert API List to Entity List
  List<RoutineEntity> toEntityList(List<RoutineApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [routineId, routineStatus, completedAt, enrolledAt, user];
}
