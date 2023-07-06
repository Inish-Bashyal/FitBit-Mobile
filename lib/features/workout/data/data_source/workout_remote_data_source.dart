import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/core/failure/failure.dart';
import 'package:fitbit/core/network/remote/http_service.dart';
import 'package:fitbit/core/shared_prefs/user_shared_prefs.dart';
import 'package:fitbit/features/auth/data/model/auth_api_model.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/workout/data/dto/get_all_user_by_workout.dart';
import 'package:fitbit/features/workout/data/dto/get_all_workout_dto.dart';
import 'package:fitbit/features/workout/data/model/workout_api_model.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutRemoteDataSourceProvider = Provider(
  (ref) => WorkoutRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    workoutApiModel: ref.read(workoutApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    authApiModel: ref.read(authApiModelProvider),
  ),
);

class WorkoutRemoteDataSource {
  final Dio dio;
  final WorkoutApiModel workoutApiModel;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;

  WorkoutRemoteDataSource({
    required this.dio,
    required this.workoutApiModel,
    required this.authApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addWorkout(WorkoutEntity workout) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createWorkout,
        data: {
          "title": workout.title,
          "nameOfWorkout": workout.nameOfWorkout,
          "image": workout.image,
          "day": workout.day,
          "numberOfReps": workout.numberOfReps,
        },
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<WorkoutEntity>>> getAllWorkouts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllWorkout);
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllWorkoutDTO batchAddDTO = GetAllWorkoutDTO.fromJson(response.data);
        return Right(workoutApiModel.toEntityList(batchAddDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  // Get all students by workoutId
  Future<Either<Failure, List<UserEntity>>> getAllUserByWorkout(
      String workoutId) async {
    try {
      // get token
      String? token;
      await userSharedPrefs
          .getUserToken()
          .then((value) => value.fold((l) => null, (r) => token = r!));

      var response =
          await dio.get(ApiEndpoints.getAllUsersByWorkout + workoutId,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              ));
      if (response.statusCode == 201) {
        GetAllUserByWorkoutDTO getAllWorkoutDTO =
            GetAllUserByWorkoutDTO.fromJson(response.data);

        return Right(authApiModel
            .listFromJson(getAllWorkoutDTO.data.cast<AuthApiModel>()));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteWorkout(String workoutId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteworkout + workoutId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}



//  // 1st way
//         var batches = (response.data['data'] as List)
//             .map((batch) => BatchApiModel.fromJson(batch).toEntity())
//             .toList();
//         return Right(batches);
