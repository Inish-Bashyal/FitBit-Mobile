import 'package:fitbit/core/common/snackbar/my_snackbar.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/routine/domain/use_case/routine_use_case.dart';
import 'package:fitbit/features/routine/presentation/state/routine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineViewModelProvider =
    StateNotifierProvider<RoutineViewModel, RoutineState>(
  (ref) {
    return RoutineViewModel(ref.read(routineUsecaseProvider));
  },
);

class RoutineViewModel extends StateNotifier<RoutineState> {
  final RoutineUseCase routineUseCase;

  RoutineViewModel(this.routineUseCase) : super(RoutineState.initial());

  addWorkout(RoutineEntity routine) async {
    state.copyWith(isLoading: true);
    var data = await routineUseCase.addRoutine(routine);

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
    }, (r) {
      state.routines.add(routine);
      state = state.copyWith(isLoading: false, error: null);
    });
  }

  getAllWorkouts() async {
    state = state.copyWith(isLoading: true);
    var data = await routineUseCase.getAllRoutines();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, routines: r, error: null),
    );
  }

  Future<void> deleteWorkout(
      BuildContext context, RoutineEntity routine) async {
    state.copyWith(isLoading: true);
    var data = await routineUseCase.deleteRoutine(routine.routineId!);

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

  Future<void> updateWorkout(
      BuildContext context, RoutineEntity routine) async {
    state.copyWith(isLoading: true);
    var data = await routineUseCase.updateRoutine(routine.routineId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.routines.add(routine);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Workout updated successfully',
          context: context,
        );
      },
    );
  }
}
