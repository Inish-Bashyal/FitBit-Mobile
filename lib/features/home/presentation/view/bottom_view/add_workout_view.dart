import 'dart:io';

import 'package:fitbit/config/constants/api_endpoint.dart';
import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/core/common/snackbar/my_snackbar.dart';
import 'package:fitbit/core/common/widgets/textfield_widget.dart';
import 'package:fitbit/features/workout/domain/entity/workout_entity.dart';
import 'package:fitbit/features/workout/presentation/viewmodel/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddWorkoutView extends ConsumerStatefulWidget {
  final WorkoutEntity? workoutToUpdate; // Add this property

  const AddWorkoutView({Key? key, this.workoutToUpdate}) : super(key: key);

  @override
  ConsumerState<AddWorkoutView> createState() => _AddWorkoutViewState();
}

class _AddWorkoutViewState extends ConsumerState<AddWorkoutView> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final nameController = TextEditingController();
  final dayController = TextEditingController();
  final repsNumController = TextEditingController();

  String? updateImage;

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
  void initState() {
    super.initState();

    // Set the initial values of text controllers based on the workoutToUpdate
    if (widget.workoutToUpdate != null) {
      titleController.text = widget.workoutToUpdate!.title;
      nameController.text = widget.workoutToUpdate!.nameOfWorkout;
      dayController.text = widget.workoutToUpdate!.day;
      repsNumController.text = widget.workoutToUpdate!.numberOfReps;
      // Set the image if it exists
      updateImage = widget.workoutToUpdate!.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(workoutViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.workoutToUpdate == null ? 'Add Workout' : 'Update Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
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
                          : widget.workoutToUpdate?.image != null
                              ? NetworkImage(
                                  ApiEndpoints.imageUrl +
                                      widget.workoutToUpdate!.image!,
                                )
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
                      if (_formKey.currentState!.validate()) {
                        var workout = WorkoutEntity(
                          title: titleController.text,
                          nameOfWorkout: nameController.text,
                          day: dayController.text,
                          numberOfReps: repsNumController.text,
                          image: ref.read(workoutViewModelProvider).image,
                        );

                        if (widget.workoutToUpdate != null) {
                          // Update existing workout
                          ref
                              .read(workoutViewModelProvider.notifier)
                              .updateWorkout(context, workout);
                        } else {
                          // Add new workout
                          ref
                              .read(workoutViewModelProvider.notifier)
                              .addWorkout(workout);
                        }

                        if (workoutState.error != null) {
                          showSnackBar(
                            message: workoutState.error.toString(),
                            context: context,
                            color: Colors.red,
                          );
                        } else {
                          showSnackBar(
                            message: widget.workoutToUpdate == null
                                ? 'Workout Added successfully'
                                : 'Workout Updated successfully',
                            context: context,
                          );
                        }
                        Navigator.pushNamed(context, AppRoute.dashboardRoute);
                      }
                    },
                    child: Text(widget.workoutToUpdate == null
                        ? 'Add Workout'
                        : 'Update Workout'),
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
