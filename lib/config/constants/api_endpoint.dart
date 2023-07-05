class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://localhost:3000/";
  static const String baseUrl = "http://10.0.2.2:3000/";
  //static const String baseUrl = "http://172.21.0.211:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "users/login";
  static const String register = "users/register";
  static const String getAllStudent = "auth/getAllUsers";
  static const String getAllUsersByWorkout = "auth/getUsersByWorkout/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateUser/";
  static const String deleteStudent = "auth/deleteUser/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "users/uploadImage";

  //====================== Batch Routes ======================
  static const String createWorkout = "batch/createWorkout";
  static const String getAllWorkout = "batch/getAllWorkouts";

  // ====================== Course Routes ======================
  // static const String createCourse = "course/createCourse";
  // static const String getAllCourse = "course/getAllCourses";
}
