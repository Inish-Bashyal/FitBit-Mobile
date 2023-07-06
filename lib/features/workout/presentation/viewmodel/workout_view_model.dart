import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/domain/use_case/workout_use_case.dart';
import 'package:fitbit/features/workout/presentation/state/workout_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutViewModelProvider =
    StateNotifierProvider<WorkoutViewModel, WorkoutState>(
  (ref) {
    return WorkoutViewModel(ref.read(workoutUsecaseProvider));
  },
);

class WorkoutViewModel extends StateNotifier<WorkoutState> {
  final WorkoutUseCase workoutUseCase;

  WorkoutViewModel(this.workoutUseCase) : super(WorkoutState.initial()) {
    getAllWorkouts();
  }

  addWorkout(WorkoutEntity workout) async {
    state.copyWith(isLoading: true);
    var data = await workoutUseCase.addWorkout(workout);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllWorkouts() async {
    state = state.copyWith(isLoading: true);
    var data = await workoutUseCase.getAllWorkouts();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, workouts: r, error: null),
    );
  }

  // getUsersByWorkout(BuildContext context, String workoutId) async {
  //   state = state.copyWith(isLoading: true);
  //   var data = await workoutUseCase.getAllUsersByWorkout(workoutId);

  //   data.fold(
  //     (l) => state = state.copyWith(isLoading: false, error: l.error),
  //     (r) {
  //       state = state.copyWith(isLoading: false, workouts: r, error: null);
  //       Navigator.pushNamed(context, AppRoute.dashboardRoute);
  //     },
  //   );
  // }
}
