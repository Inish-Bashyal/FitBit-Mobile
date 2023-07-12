import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/core/common/widgets/cardview_widget.dart';
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
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final wokroutState = ref.watch(workoutViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(ApiEndpoints.imageUrl +
                              (authState.imageName ?? '')),
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
                      for (int i = 0;
                          i < wokroutState.workouts.length;
                          i++) ...{
                        WorkoutLocalCard(index: i),
                      },
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
      ),
    );
  }
}
