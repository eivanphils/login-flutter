import 'package:flutter/material.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/theme/app_theme.dart';

void main() {
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen()
      },
      theme: AppTheme.lightTheme
    );
  }
}