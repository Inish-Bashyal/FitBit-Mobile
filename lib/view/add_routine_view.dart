import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddRoutineView extends StatefulWidget {
  const AddRoutineView({super.key});

  @override
  State<AddRoutineView> createState() => _AddRoutineViewState();
}

class _AddRoutineViewState extends State<AddRoutineView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Add Routine',
        ),
      ),
    );
  }
}
