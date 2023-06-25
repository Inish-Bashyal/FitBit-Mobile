import 'package:fitbit/core/common/widgets/cardview_widget.dart';
import 'package:fitbit/features/home/presentation/view/bottom_view/profile_view.dart';
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

      body: SafeArea(
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
                            'https://media.licdn.com/dms/image/D5603AQG-BMXz9ds3Kw/profile-displayphoto-shrink_800_800/0/1674663322596?e=2147483647&v=beta&t=-ASZP2s-NHHfPfozLn9l2mmYZh--8RipLD-v_6lENrc'),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_outline,
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
