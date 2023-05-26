import 'package:flutter/material.dart';

class WorkoutPlansView extends StatefulWidget {
  const WorkoutPlansView({super.key});

  @override
  State<WorkoutPlansView> createState() => _WorkoutPlansViewState();
}

class _WorkoutPlansViewState extends State<WorkoutPlansView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Workout Plans',
        ),
      ),
    );
  }
}
