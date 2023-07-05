import 'package:fitbit/config/constants/hive_table_constant.dart';
import 'package:fitbit/features/auth/data/model/auth_hive_model.dart';
import 'package:fitbit/features/workout/data/model/workout_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // ======================== Workout Queries ========================
  Future<void> addWorkout(WorkoutHiveModel workout) async {
    var box =
        await Hive.openBox<WorkoutHiveModel>(HiveTableConstant.workoutBox);
    await box.put(workout.workoutId, workout);
  }

  Future<List<WorkoutHiveModel>> getAllWorkouts() async {
    var box =
        await Hive.openBox<WorkoutHiveModel>(HiveTableConstant.workoutBox);
    var workouts = box.values.toList();
    box.close();
    return workouts;
  }

  // ======================== User Queries ========================
  Future<void> addUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userID, user);
  }

  Future<List<AuthHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var students = box.values.toList();
    box.close();
    return students;
  }

  //Login
  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.username == username && element.password == password);
    box.close();
    return user;
  }

  // ======================== Insert Dummy Data ========================
  // Batch Dummy Data
  // Future<void> addDummybatch() async {
  //   // check of batch box is empty
  //   var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
  //   if (box.isEmpty) {
  //     final batch1 = BatchHiveModel(batchName: '29-A');
  //     final batch2 = BatchHiveModel(batchName: '29-B');
  //     final batch3 = BatchHiveModel(batchName: '30-A');
  //     final batch4 = BatchHiveModel(batchName: '30-B');

  //     List<BatchHiveModel> batches = [batch1, batch2, batch3, batch4];

  //     // Insert batch with key
  //     for (var batch in batches) {
  //       await addBatch(batch);
  //     }
  //   }
  // }

  // Future<void> addDummyCourse() async {
  //   // check of course box is empty
  //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
  //   if (box.isEmpty) {
  //     final course1 = CourseHiveModel(courseName: 'Flutter');
  //     final course2 = CourseHiveModel(courseName: 'Dart');
  //     final course3 = CourseHiveModel(courseName: 'Java');
  //     final course4 = CourseHiveModel(courseName: 'Kotlin');

  //     List<CourseHiveModel> courses = [course1, course2, course3, course4];

  //     // Insert course with key
  //     for (var course in courses) {
  //       await addCourse(course);
  //     }
  //   }
  // }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    await Hive.deleteFromDisk();
  }
}
