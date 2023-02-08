import 'package:flutter/material.dart';

import 'package:login_flutter/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250,),
              CardContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text('Bienvenido nuevamente', style: Theme.of(context).textTheme.headline6,),

                      const SizedBox(height: 30,),
                      const Text('formulario'),

                      const SizedBox(height: 30,),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: TextButton(
                          onPressed: () {  },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xFF26d07c))
                          ),
                          child: Text('Enviar'.toUpperCase(), style: const TextStyle(
                            color: Colors.white,
                            
                          ),),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}