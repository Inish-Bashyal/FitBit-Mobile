import 'package:fitbit/widgets/cardview_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var gap = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 110, 110),
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('assets/images/logo1.png'),
            ),
            const Text(
              'Popular Routines',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    cardView('assets/images/bg.jpg', 'Routine 1',
                        'Description 1', context),
                    cardView('assets/images/bg.jpg', 'Routine 2',
                        'Description 2', context),
                    cardView('assets/images/bg.jpg', 'Routine 3',
                        'Description 3', context),
                    cardView('assets/images/bg.jpg', 'Routine 4',
                        'Description 4', context),
                    cardView('assets/images/bg.jpg', 'Routine 5',
                        'Description 5', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
