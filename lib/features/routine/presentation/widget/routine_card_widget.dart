// import 'package:fitbit/config/constants/api_endpoint.dart';
// import 'package:fitbit/features/routine/domain/entity/routine_entity.dart';
// import 'package:fitbit/features/routine/presentation/viewmodel/routine_view_model.dart';
// import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
// import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

// class RoutineCardWidget extends ConsumerWidget {
//   final int index;

//   const RoutineCardWidget({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final routineState = ref.watch(routineViewModelProvider);
//     final List<RoutineEntity> lstRoutine = routineState.routines;

//     final WorkoutEntity selectedWorkout = lstRoutine[index].workout;

//     return SizedBox(
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Image.network(
//               selectedWorkout.image != null
//                   ? ApiEndpoints.imageUrl + selectedWorkout.image!
//                   : "",
//               width: 200,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 selectedWorkout.title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 selectedWorkout.nameOfWorkout,
//                 style: const TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     _markRoutineAsComplete(
//                         context, ref, lstRoutine[index].routineId!);
//                   },
//                   child: const Text("Mark as Complete"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _deleteRoutine(ref, lstRoutine[index]);
//                   },
//                   child: const Text("Delete"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _markRoutineAsComplete(
//       BuildContext context, WidgetRef ref, String routineId) async {
//     // Call the view model to mark the routine as complete
//     await ref
//         .read(routineViewModelProvider.notifier)
//         .updateRoutine(context, routineId);
//   }

//   void _deleteRoutine(WidgetRef ref, RoutineEntity routine) async {
//     // Call the view model to delete the routine
//     await ref
//         .read(routineViewModelProvider.notifier)
//         .deleteRoutine(context, routine);
//   }
// }
