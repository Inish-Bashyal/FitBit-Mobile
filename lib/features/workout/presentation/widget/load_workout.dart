import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadWorkout extends StatelessWidget {
  final WidgetRef ref;
  final List<WorkoutEntity> lstBatch;
  const LoadWorkout({super.key, required this.lstBatch, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstBatch.length,
      itemBuilder: ((context, index) => ListTile(
          title: Text(lstBatch[index].title),
          subtitle: Text(lstBatch[index].nameOfWorkout),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      'Are you sure you want to delete ${lstBatch[index].title}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ref
                              .read(workoutViewModelProvider.notifier)
                              .deleteWorkout(context, lstBatch[index]);
                        },
                        child: const Text('Yes')),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ))),
    );
  }
}
