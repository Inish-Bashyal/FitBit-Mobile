import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/core/failure/failure.dart';
import 'package:fitbit/core/network/remote/http_service.dart';
import 'package:fitbit/core/shared_prefs/user_shared_prefs.dart';
import 'package:fitbit/features/routine/data/dto/get_all_routine_dto.dart';
import 'package:fitbit/features/routine/data/model/routine_api_model.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineRemoteDataSourceProvider = Provider(
  (ref) => RoutineRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    routineApiModel: ref.read(routineApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class RoutineRemoteDataSource {
  final Dio dio;
  final RoutineApiModel routineApiModel;
  final UserSharedPrefs userSharedPrefs;

  RoutineRemoteDataSource({
    required this.dio,
    required this.routineApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addRoutine(RoutineEntity routine) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      var response = await dio.post(
        ApiEndpoints.createRoutine,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          "user": routine.user,
          "workout": routine.workout,
          "routineStatus": routine.routineStatus,
          "enrolledAt": routine.enrolledAt,
          "completedAt": routine.completedAt,
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

  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines() async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      var response = await dio.get(
        ApiEndpoints.getAllRoutine,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllRoutineDTO routineAddDTO =
            GetAllRoutineDTO.fromJson(response.data);
        return Right(routineApiModel.toEntityList(routineAddDTO.data));
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

  Future<Either<Failure, bool>> deleteRoutine(String routineId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteRoutine + routineId,
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

  Future<Either<Failure, bool>> updateWorkout(String workoutId) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.put(
        ApiEndpoints.updateRoutine + workoutId,
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
