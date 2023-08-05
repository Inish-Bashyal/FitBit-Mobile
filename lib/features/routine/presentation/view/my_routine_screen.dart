import 'package:fitbit/features/routine/presentation/viewmodel/routine_widget.dart';
import 'package:flutter/material.dart';

class MyRoutineScreen extends StatelessWidget {
  const MyRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming you have a list of routines fetched from the API
    final List<Map<String, dynamic>> fetchedRoutines = [
      {
        'routineId': '1',
        'workoutImage':
            'https://example.com/image1.jpg', // Replace with actual image URL
        'workoutTitle': 'Chest',
        'workoutName': 'Push Ups',
        'numberOfReps': '20',
        'day': 'Monday',
        'enrolledAt': '2023-08-02T16:45:46.911Z',
        'routineStatus': 'Completed',
        'completedAt': '2023-08-02T16:46:02.000Z',
      },
      // Add more routines if needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Routines'),
      ),
      body: ListView.builder(
        itemCount: fetchedRoutines.length,
        itemBuilder: (context, index) {
          final routine = fetchedRoutines[index];
          return RoutineWidget(
            routineId: routine['routineId'],
            workoutImage: routine['workoutImage'],
            workoutTitle: routine['workoutTitle'],
            workoutName: routine['workoutName'],
            numberOfReps: routine['numberOfReps'],
            day: routine['day'],
            enrolledAt: routine['enrolledAt'],
            routineStatus: routine['routineStatus'],
            completedAt: routine['completedAt'],
          );
        },
      ),
    );
  }
}
