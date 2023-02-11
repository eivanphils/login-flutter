import 'package:flutter/material.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Column(
          children: [
            const SizedBox(height: 250,),
            CardContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric( vertical: 20),
                child: Column(
                  children: [
                      Text(
                        'Registro de nuevo usuario',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('aca vna los inputs del formualrio de registro'),

                      const SizedBox(height: 30,),
                      // TODO: crear una clave custom del boton con bordes
                       ElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();

                          await Future.delayed(const Duration(seconds: 3));

                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                            child: Text('Crear cuenta'.toUpperCase())),
                        style: ElevatedButton.styleFrom(
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            primary: AppTheme.primaryColor,
                            elevation: 0),
                      ),

                      const SizedBox(height: 15,),
                    ],
                  ),
              ),
            )
          ],
        )
      ),
    );
  }
}
