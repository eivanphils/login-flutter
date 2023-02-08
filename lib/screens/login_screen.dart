import 'package:flutter/material.dart';

import 'package:login_flutter/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground()
    );
  }
}