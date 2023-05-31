import 'package:fitbit/view/add_routine_view.dart';
import 'package:fitbit/view/home_view.dart';
import 'package:fitbit/view/routines_view.dart';
import 'package:fitbit/view/support_view.dart';
import 'package:fitbit/view/workoutplans_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeView(),
    const WorkoutPlansView(),
    const RoutineView(),
    const SupportView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRoutineView()),
          );
        },
        shape: const CircleBorder(),
        // backgroundColor: Colors.black,
        child: const Icon(Icons.add_task),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            label: 'Workout Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Routines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Support',
          ),
        ],
        // backgroundColor: const Color.fromRGBO(91, 44, 146, 1.0),
        // selectedItemColor: const Color.fromARGB(255, 12, 12, 12),
        // unselectedItemColor: const Color.fromARGB(255, 112, 110, 110),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
