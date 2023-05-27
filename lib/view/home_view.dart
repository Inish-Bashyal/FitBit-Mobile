import 'package:fitbit/view/profile_view.dart';
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
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 112, 110, 110),
      //   title: const Text('Home'),
      //   centerTitle: true,
      //   elevation: 0,
      //   iconTheme: const IconThemeData.fallback(),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileView()),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://www.cnet.com/a/img/resize/ed39b854b33cee2a83301c229c702dae6fd314a9/hub/2019/05/06/1adfd325-7ab6-41dc-8e8d-755b50cec10d/game-of-thrones-season-8-episode-4-dany-after-missandei.jpg?auto=webp&fit=crop&height=675&width=1200'),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.bookmark_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const Text(
                'New Workout',
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
                      cardView('assets/images/logo1.png', 'Workout 1',
                          'Description 1', context),
                      cardView('assets/images/logo1.png', 'Workout 2',
                          'Description 2', context),
                      cardView('assets/images/logo1.png', 'Workout 3',
                          'Description 3', context),
                      cardView('assets/images/logo1.png', 'Workout 4',
                          'Description 4', context),
                      cardView('assets/images/logo1.png', 'Workout 5',
                          'Description 5', context),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
