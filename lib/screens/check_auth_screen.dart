import 'package:login_flutter/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
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
              if(snapshot.data == '') {
                 Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              } else {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              }
            });

            return Container();
          },
        ),
      ),
    );
  }
}
