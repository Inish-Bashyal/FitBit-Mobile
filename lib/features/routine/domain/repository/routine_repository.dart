import 'package:dartz/dartz.dart';
import 'package:fitbit/core/common/provider/internet_connectivity.dart';
import 'package:fitbit/core/failure/failure.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/routine/data/data_source/routine_local_data_source.dart';
import 'package:fitbit/features/routine/data/data_source/routine_remote_data_source.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineRepositoryProvider = Provider<IRoutineRepository>(
  (ref) {
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(routineRemoteDataSourceProvider
          as AlwaysAliveProviderListenable<IRoutineRepository>);
    } else {
      // If internet is not available then return local repo
      return ref.watch(routineLocalDataSourceProvider
          as AlwaysAliveProviderListenable<IRoutineRepository>);
    }
  },
);

abstract class IRoutineRepository {
  Future<Either<Failure, List<RoutineEntity>>> getAllRoutines();
  Future<Either<Failure, List<RoutineEntity>>> getMyRoutines();
  Future<Either<Failure, bool>> addRoutine(RoutineEntity routine);
  Future<Either<Failure, List<UserEntity>>> getAllUsersByRoutine(
      String routineId);
  Future<Either<Failure, bool>> deleteRoutine(String id);
  Future<Either<Failure, bool>> updateRoutine(String id);
}
