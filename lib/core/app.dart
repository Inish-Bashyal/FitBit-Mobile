import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/config/themes/app_themes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(),
      initialRoute: AppRoute.splashRoute,
      routes: AppRoute.getAppRoutes(),
    );
  }
}
