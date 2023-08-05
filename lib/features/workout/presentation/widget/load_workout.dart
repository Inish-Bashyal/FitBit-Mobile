import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
import 'package:fitbit/features/routine/presentation/viewmodel/routine_view_model.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:fitbit/features/workout/presentation/widget/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadWorkout extends StatelessWidget {
  final WidgetRef ref;
  final List<WorkoutEntity> lstWorkout;

  const LoadWorkout({Key? key, required this.lstWorkout, required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final user = authState.user;

    return ListView.builder(
      itemCount: lstWorkout.length,
      itemBuilder: (context, index) {
        // final workout = lstWorkout[index];
        return WorkoutCard(
          imagePath: lstWorkout[index].image != null
              ? ApiEndpoints.imageUrl + lstWorkout[index].image!
              : null,
          title: lstWorkout[index].title,
          nameOfWorkout: lstWorkout[index].nameOfWorkout,
          onDelete: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                    'Are you sure you want to delete ${lstWorkout[index].title}?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ref
                          .read(workoutViewModelProvider.notifier)
                          .deleteWorkout(context, lstWorkout[index]);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          },
          onEdit: () {
            // Implement the edit functionality here
          },
          follow: () async {
            final newRoutine = RoutineEntity(
              user: user,
              workout: lstWorkout[index],
              enrolledAt: DateTime.now(),
              routineStatus: "Processing",
              completedAt: null,
            );

            ref.read(routineViewModelProvider.notifier).addRoutine(newRoutine);
          },
        );
      },
    );
  }
}
