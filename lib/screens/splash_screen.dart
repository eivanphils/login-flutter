import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:login_flutter/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, LoginScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://assets10.lottiefiles.com/packages/lf20_cLy6XL.json',
          repeat: true,
          reverse: true,
          animate: true,
          width: 300,
          height: 300
        ),
      ),
    );
  }
}
