import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/routine/presentation/viewmodel/routine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutineCardWidget extends ConsumerWidget {
  final int index;

  const RoutineCardWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineState = ref.watch(routineViewModelProvider);
    final List<RoutineEntity> lstRoutine = routineState.routines;

    final routineStateFinal = ref.watch(authViewModelProvider);
    final List<RoutineEntity>? lstFinalRoutine = routineStateFinal.routines;
    final RoutineEntity finalselected = lstFinalRoutine![index];

    final imageName = finalselected.workout!.image;

    final RoutineEntity selectedRoutine = lstRoutine[index];
    return SizedBox(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.network(
              ApiEndpoints.imageUrl + (imageName!),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                finalselected.workout!.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                finalselected.workout!.nameOfWorkout,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                finalselected.workout!.numberOfReps,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                finalselected.workout!.day,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(routineViewModelProvider.notifier)
                        .updateRoutine(context, selectedRoutine.routineId!);
                  },
                  child: const Text("Mark as Complete"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(routineViewModelProvider.notifier)
                        .deleteRoutine(context, selectedRoutine);
                  },
                  child: const Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void _markRoutineAsComplete(
  //     BuildContext context, WidgetRef ref, RoutineEntity routine) async {
  //   await ref
  //       .read(routineViewModelProvider.notifier)
  //       .updateRoutine(context, routine.routineId!);
  // }
}
