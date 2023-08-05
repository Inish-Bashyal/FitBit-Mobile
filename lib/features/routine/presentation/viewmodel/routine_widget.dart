import 'package:flutter/material.dart';

class RoutineWidget extends StatelessWidget {
  final String routineId;
  final String workoutImage;
  final String workoutTitle;
  final String workoutName;
  final String numberOfReps;
  final String day;
  final String enrolledAt;
  final String routineStatus;
  final String completedAt;

  const RoutineWidget({
    super.key,
    required this.routineId,
    required this.workoutImage,
    required this.workoutTitle,
    required this.workoutName,
    required this.numberOfReps,
    required this.day,
    required this.enrolledAt,
    required this.routineStatus,
    required this.completedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(workoutImage), // Load image from URL
        title: Text(workoutTitle),
        subtitle: Text('Workout: $workoutName\nReps: $numberOfReps\nDay: $day'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enrolled At: $enrolledAt'),
            Text('Status: $routineStatus'),
            Text('Completed At: $completedAt'),
          ],
        ),
      ),
    );
  }
}
