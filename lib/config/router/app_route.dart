import 'package:fitbit/features/auth/presentation/view/login_view.dart';
import 'package:fitbit/features/auth/presentation/view/register_view.dart';
import 'package:fitbit/features/home/presentation/view/bottom_view/add_routine_view.dart';
import 'package:fitbit/features/splash/presentation/view/splash_screen.dart';
import 'package:fitbit/view/dashboard_view.dart';

class AppRoute {
  AppRoute._();

  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String dashboardRoute = '/dashboard';
  static const String splashRoute = '/splash';
  static const String addRoutineRoute = '/addRoutine';

  static getAppRoutes() {
    return {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      dashboardRoute: (context) => const DashboardView(),
      splashRoute: (context) => const SplashScreenView(),
      addRoutineRoute: (context) => const AddRoutineView(),
    };
  }
}
