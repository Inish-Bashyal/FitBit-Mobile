// profile_view.dart

import 'dart:io';

import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  var gap = const SizedBox(
    height: 20,
  );

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;

  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          ref.read(authViewModelProvider.notifier).uploadImage(_img!);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 110, 110),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: FutureBuilder<void>(
              future: fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Handle error if any
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return buildProfileContent();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchUserData() async {
    var authState = ref.watch(authViewModelProvider);
    var user = authState.user!;
    firstNameController.text = user.firstname;
    lastNameController.text = user.lastname;
    ageController.text = user.age;
    genderController.text = user.gender;
    emailController.text = user.email;
    usernameController.text = user.username;
  }

  Widget buildProfileContent() {
    var authState = ref.watch(authViewModelProvider);

    return Column(
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
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.grey[300],
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              checkCameraPermission();
                              _browseImage(ref, ImageSource.camera);
                              Navigator.pop(context);
                              // Upload image it is not null
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _browseImage(ref, ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.image),
                            label: const Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _img != null
                        ? FileImage(_img!)
                        : NetworkImage(
                            ApiEndpoints.imageUrl +
                                (authState.user!.image ?? ''),
                          ) as ImageProvider,
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
          child: Text(
            '${authState.user!.firstname} ${authState.user!.lastname}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        gap,
        TextFormField(
          controller: firstNameController,
          decoration: const InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        TextFormField(
          controller: lastNameController,
          decoration: const InputDecoration(
            labelText: 'Last Name',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        TextFormField(
          controller: ageController,
          decoration: const InputDecoration(
            labelText: 'Age',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        TextFormField(
          controller: genderController,
          decoration: const InputDecoration(
            labelText: 'Gender',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
        gap,
        ElevatedButton(
          onPressed: () {
            // Implement the update functionality here
            // updateUserData();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }

  Future<void> updateUserData() async {
    var authState = ref.watch(authViewModelProvider);

    // Fetch the updated values from the text fields
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String age = ageController.text;
    String gender = genderController.text;
    String email = emailController.text;
    String username = usernameController.text;

    // Create a new UserEntity with the updated values
    var updatedUser = UserEntity(
      userID: authState.user!.userID, // Keep the same userID
      firstname: firstName,
      lastname: lastName,
      age: age,
      gender: gender,
      email: email,
      username: username,
      password: authState.user!.password, // Keep the same password
    );

    // Call the view model to update the user data
    ref.read(authViewModelProvider.notifier).updateUser(updatedUser);
    // var result = await authViewModel.updateUser(updatedUser);

    // result.fold(
    //   (failure) {
    //     // Handle the failure here
    //     showSnackBar(
    //       message: 'Failed to update user data',
    //       context: context,
    //       color: Colors.red,
    //     );
    //   },
    //   (success) {
    //     // User data updated successfully
    //     showSnackBar(
    //       message: 'User data updated successfully',
    //       context: context,
    //     );
    //   },
    // );
  }
}
