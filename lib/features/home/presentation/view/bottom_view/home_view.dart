// Import the cached_network_image package
import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:fitbit/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:fitbit/features/workout/presentation/widget/local_workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  var gap = const SizedBox(
    height: 20,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch user data when the HomeView is initialized
    ref.read(authViewModelProvider.notifier).getUser();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final wokroutState = ref.watch(workoutViewModelProvider);
    final UserEntity? user = authState.user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileView(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        ApiEndpoints.imageUrl + (user?.image ?? ''),
                      ),
                    ),
                  ),
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
                      for (int i = 0;
                          i < wokroutState.workouts.length;
                          i++) ...{
                        WorkoutLocalCard(index: i),
                      },
                    ],
                  ),
                ),
              ),
              // const Text(
              //   'Popular Routines',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.all(4.0),
              //     child: Row(
              //       children: [
              //         cardView('assets/images/bg.jpg', 'Routine 1',
              //             'Description 1', context),
              //         cardView('assets/images/bg.jpg', 'Routine 2',
              //             'Description 2', context),
              //         cardView('assets/images/bg.jpg', 'Routine 3',
              //             'Description 3', context),
              //         cardView('assets/images/bg.jpg', 'Routine 4',
              //             'Description 4', context),
              //         cardView('assets/images/bg.jpg', 'Routine 5',
              //             'Description 5', context),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
