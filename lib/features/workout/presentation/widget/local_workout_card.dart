import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';

class WorkoutLocalCard extends ConsumerStatefulWidget {
  final int index;

  const WorkoutLocalCard({Key? key, required this.index}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorkoutLocalCardState();
}

class _WorkoutLocalCardState extends ConsumerState<WorkoutLocalCard> {
  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(workoutViewModelProvider);
    final List<WorkoutEntity> lstWorkout = workoutState.workouts;

    return GestureDetector(
      onTap: () {
        MotionToast.success(description: const Text("This is clicked"))
            .show(context);
      },
      child: SizedBox(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.network(
                ApiEndpoints.imageUrl + lstWorkout[widget.index].image!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lstWorkout[widget.index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lstWorkout[widget.index].nameOfWorkout,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
