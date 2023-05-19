import 'package:fitbit/view/dashboard_view.dart';
import 'package:fitbit/view/login_view.dart';
import 'package:fitbit/view/register_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginRoute',
      routes: {
        '/loginRoute': (context) => const LoginView(),
        '/registerRoute': (context) => const RegisterView(),
        '/dashboardRoute': (context) => const DashboardView(),
      },
    );
  }
}
