import 'package:fitbit/core/common/snackbar/my_snackbar.dart';
import 'package:fitbit/features/routine/data/repository/routine_remote_repo_impl.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/routine/domain/repository/routine_repository.dart';
import 'package:fitbit/features/routine/presentation/state/routine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineViewModelProvider =
    StateNotifierProvider<RoutineViewModel, RoutineState>(
  (ref) {
    return RoutineViewModel(ref.read(routineRemoteRepoProvider));
  },
);

class RoutineViewModel extends StateNotifier<RoutineState> {
  final IRoutineRepository routineRepository;

  RoutineViewModel(this.routineRepository) : super(RoutineState.initial());

  addRoutine(RoutineEntity routine) async {
    state.copyWith(isLoading: true);
    var data = await routineRepository.addRoutine(routine);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (r) {
      state.routines.add(routine);
      state = state.copyWith(isLoading: false, error: null);
    });
  }

  getAllRoutines() async {
    state = state.copyWith(isLoading: true);
    var data = await routineRepository.getAllRoutines();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, routines: r, error: null),
    );
  }

  Future<void> deleteRoutine(
      BuildContext context, RoutineEntity routine) async {
    state.copyWith(isLoading: true);
    var data = await routineRepository.deleteRoutine(routine.routineId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.routines.remove(routine);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Workout delete successfully',
          context: context,
        );
      },
    );
  }

  Future<void> updateRoutine(BuildContext context, String routineId) async {
    state.copyWith(isLoading: true);

    // Check if the routine status is already 'Completed'
    int index =
        state.routines.indexWhere((element) => element.routineId == routineId);
    if (index < 0) {
      state = state.copyWith(
          isLoading: false, error: "Routine not found in the list.");
      return;
    }

    if (state.routines[index].routineStatus == 'Completed') {
      state = state.copyWith(
          isLoading: false, error: "Routine is already marked as complete.");
      return;
    }

    var data = await routineRepository.updateRoutine(routineId);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // Create a new RoutineEntity with updated values
        RoutineEntity updatedRoutine = state.routines[index].copyWith(
          routineStatus: 'Completed',
        );

        // Update the routine status in the list of routines
        state.routines[index] = updatedRoutine;
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Routine marked as complete successfully',
          context: context,
        );
      },
    );
  }
}
