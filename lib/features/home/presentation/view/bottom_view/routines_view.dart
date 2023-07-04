import 'package:flutter/material.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({super.key});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routines'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Routines',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add New Routine'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
