import 'dart:io';

import 'package:fitbit/core/common/widgets/textfield_widget.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddRoutineView extends StatefulWidget {
  const AddRoutineView({super.key});

  @override
  State<AddRoutineView> createState() => _AddRoutineViewState();
}

class _AddRoutineViewState extends State<AddRoutineView> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final nameController = TextEditingController();
  final dayController = TextEditingController();
  final repsNumController = TextEditingController();

  var gap = const SizedBox(
    height: 20,
  );

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
        title: const Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // InkWell(
              //   onTap: () {
              //     showModalBottomSheet(
              //       backgroundColor: Colors.grey[300],
              //       context: context,
              //       isScrollControlled: true,
              //       shape: const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.vertical(
              //           top: Radius.circular(20),
              //         ),
              //       ),
              //       builder: (context) => Padding(
              //         padding: const EdgeInsets.all(20),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             ElevatedButton.icon(
              //               onPressed: () {
              //                 checkCameraPermission();
              //                 _browseImage(ref, ImageSource.camera);
              //                 Navigator.pop(context);
              //                 // Upload image it is not null
              //               },
              //               icon: const Icon(Icons.camera),
              //               label: const Text('Camera'),
              //             ),
              //             ElevatedButton.icon(
              //               onPressed: () {
              //                 _browseImage(ref, ImageSource.gallery);
              //                 Navigator.pop(context);
              //               },
              //               icon: const Icon(Icons.image),
              //               label: const Text('Gallery'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              //   child: SizedBox(
              //     height: 200,
              //     width: 200,
              //     child: CircleAvatar(
              //       radius: 50,
              //       backgroundImage: _img != null
              //           ? FileImage(_img!)
              //           : const AssetImage('assets/images/profile.png')
              //               as ImageProvider,
              //     ),
              //   ),
              // ),

              customTextField(titleController, 'Title'),
              gap,
              customTextField(nameController, 'Name of WorkOut'),
              gap,
              customTextField(dayController, 'Day'),
              gap,
              customTextField(repsNumController, 'No. of Reps'),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    //   var user = UserEntity(
                    //     firstname: firstnameController.text,
                    //     lastname: lastnameController.text,
                    //     email: emailController.text,
                    //     username: usernameController.text,
                    //     password: passwordController.text,
                    //     age: ageController.text,
                    //     gender: gender,
                    //   );

                    //   ref
                    //       .read(authViewModelProvider.notifier)
                    //       .registerUser(user);

                    //   if (authState.error != null) {
                    //     showSnackBar(
                    //       message: authState.error.toString(),
                    //       context: context,
                    //       color: Colors.red,
                    //     );
                    //   } else {
                    //     showSnackBar(
                    //       message: 'Registered successfully',
                    //       context: context,
                    //     );
                    //   }
                    // }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
