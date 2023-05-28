import 'package:fitbit/view/dashboard_view.dart';
import 'package:fitbit/view/login_view.dart';
import 'package:fitbit/view/register_view.dart';

class AppRoute {
  AppRoute._();

  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String dashboardRoute = '/dashboard';
  // static const String splashRoute = '/splash';

  static getAppRoutes() {
    return {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      dashboardRoute: (context) => const DashboardView(),
      // splashRoute: (context) => const SplashScreenView(),
    };
  }
}
