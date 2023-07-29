import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  var gap = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    var authState = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 110, 110),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0IlJoOev0yf_6D_PTCHmVi1lwBJKz1B4vg&usqp=CAU',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: -70,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        radius: 200,
                        backgroundImage: NetworkImage(
                          ApiEndpoints.imageUrl + (authState.user!.image ?? ''),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              gap,
              gap,
              gap,
              gap,
              gap,
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Inish Bashyal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
