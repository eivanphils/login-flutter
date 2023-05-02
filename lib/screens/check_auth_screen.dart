import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  static const routeName = 'checkAuth';

  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // no se necesita redibujar
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.isLogged(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) const CircularProgressIndicator();

            Future.microtask(() {
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (_, __, ___) => snapshot.data == ''
                  ? const LoginScreen()
                  : const HomeScreen(),
                transitionDuration: const Duration(seconds: 0)
              ));
            });

            return Container();
          },
        ),
      ),
    );
  }
}
