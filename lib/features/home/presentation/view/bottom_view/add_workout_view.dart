import 'dart:io';

import 'package:fitbit/core/common/snackbar/my_snackbar.dart';
import 'package:fitbit/core/common/widgets/textfield_widget.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddRoutineView extends ConsumerStatefulWidget {
  const AddRoutineView({super.key});

  @override
  ConsumerState<AddRoutineView> createState() => _AddRoutineViewState();
}

class _AddRoutineViewState extends ConsumerState<AddRoutineView> {
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
          ref.read(workoutViewModelProvider.notifier).uploadImage(_img!);
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
    final workoutState = ref.watch(workoutViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
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
                          : const AssetImage('assets/images/bg2.jpeg')
                              as ImageProvider,
                    ),
                  ),
                ),
                gap,
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
                      if (formKey.currentState!.validate()) {
                        var workput = WorkoutEntity(
                          title: titleController.text,
                          nameOfWorkout: nameController.text,
                          day: dayController.text,
                          numberOfReps: repsNumController.text,
                          image: ref.read(workoutViewModelProvider).image ?? '',
                        );

                        ref
                            .read(workoutViewModelProvider.notifier)
                            .addWorkout(workput);

                        if (workoutState.error != null) {
                          showSnackBar(
                            message: workoutState.error.toString(),
                            context: context,
                            color: Colors.red,
                          );
                        } else {
                          showSnackBar(
                            message: 'Workout Added successfully',
                            context: context,
                          );
                        }
                      }
                    },
                    child: const Text('Add Workout'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
