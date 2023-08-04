import 'package:fitbit/config/constants/hive_table_constant.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'routine_hive_model.g.dart';

final routineHiveModelProvider = Provider(
  (ref) => RoutineHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.routineTableId)
class RoutineHiveModel {
  @HiveField(0)
  final String routineId;

  @HiveField(1)
  final WorkoutEntity workout;

  @HiveField(2)
  final UserEntity user;

  @HiveField(3)
  final String routineStatus;

  @HiveField(4)
  final String enrolledAt;

  @HiveField(5)
  final String completedAt;

  // empty constructor
  RoutineHiveModel.empty()
      : this(
            routineId: '',
            workout: const WorkoutEntity(
                title: '', nameOfWorkout: '', numberOfReps: '', day: ''),
            user: const UserEntity(
                firstname: '',
                lastname: '',
                age: '',
                gender: '',
                email: '',
                username: '',
                password: ''),
            routineStatus: '',
            enrolledAt: '',
            completedAt: '');

  RoutineHiveModel({
    String? routineId,
    required this.workout,
    required this.user,
    required this.routineStatus,
    required this.enrolledAt,
    required this.completedAt,
  }) : routineId = routineId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  RoutineEntity toEntity() => RoutineEntity(
        routineId: routineId,
        user: user,
        workout: workout,
        routineStatus: routineStatus,
        enrolledAt: enrolledAt,
        completedAt: completedAt,
      );

  // Convert Entity to Hive Object
  RoutineHiveModel toHiveModel(RoutineEntity entity) => RoutineHiveModel(
        // workoutId: entity.workoutId,
        user: entity.user,
        routineStatus: entity.routineStatus,
        workout: entity.workout,
        enrolledAt: entity.enrolledAt,
        completedAt: entity.completedAt,
      );

  // Convert Hive List to Entity List
  List<RoutineEntity> toEntityList(List<RoutineHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'routineId: $routineId, status: $routineStatus';
  }
}
