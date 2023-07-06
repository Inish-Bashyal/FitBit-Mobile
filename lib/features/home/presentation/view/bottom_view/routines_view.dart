import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:fitbit/features/workout/presentation/widget/load_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutineView extends ConsumerStatefulWidget {
  const RoutineView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoutineViewState();
}

class _RoutineViewState extends ConsumerState<RoutineView> {
  final batchController = TextEditingController();
  var gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var workoutState = ref.watch(workoutViewModelProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Workout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Workouts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              if (workoutState.isLoading) ...{
                const CircularProgressIndicator(),
              } else if (workoutState.error != null) ...{
                Text(workoutState.error!),
              } else if (workoutState.workouts.isNotEmpty) ...{
                Expanded(
                  child: LoadWorkout(
                    lstBatch: workoutState.workouts,
                    ref: ref,
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }
}
