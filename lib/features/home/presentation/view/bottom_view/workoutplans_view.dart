import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:fitbit/features/workout/presentation/widget/load_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutPlansView extends ConsumerWidget {
  const WorkoutPlansView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gap = const SizedBox(
      height: 20,
    );

    var sideGap = const SizedBox(
      width: 5,
    );
    var workoutState = ref.watch(workoutViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
            // gap,
            // const Text(
            //   'Our Trainers',
            //   style: TextStyle(fontSize: 25),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         for (int i = 1; i <= 5; i++) ...{
            //           Column(
            //             children: [
            //               const CircleAvatar(
            //                 radius: 50,
            //                 backgroundImage: NetworkImage(
            //                     'https://media.licdn.com/dms/image/D5603AQG-BMXz9ds3Kw/profile-displayphoto-shrink_800_800/0/1674663322596?e=2147483647&v=beta&t=-ASZP2s-NHHfPfozLn9l2mmYZh--8RipLD-v_6lENrc'),
            //               ),
            //               Text('Trainer $i'),
            //             ],
            //           ),
            //           sideGap,
            //         }
            //       ],
            //     ),
            //   ),
            // ),
            gap,
            const Text(
              'Workout Plans',
              style: TextStyle(
                fontSize: 25,
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
                  lstWorkout: workoutState.workouts,
                  ref: ref,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
