import 'package:flutter/material.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/utils/rut_validator.dart';
import 'package:login_flutter/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 210,
            ),
            CardContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      'Registro de nuevo usuario',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInputField(
                        labelText: 'Nombre',
                        hintText: 'Ingresa tu nombre',
                        prefixIcon: Icons.person,
                        onChange: (value) => print,
                        validator: (value) {
                          return value!.length < 3
                              ? 'Por favor ingrese un nombre válido'
                              : null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                        labelText: 'Apellido',
                        hintText: 'Ingresa tu apellido',
                        prefixIcon: Icons.person,
                        onChange: (value) => print,
                        validator: (value) {
                          return value!.length < 3
                              ? 'Por favor ingrese un apellido válido'
                              : null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                      prefixIcon: Icons.person,
                      labelText: 'RUT',
                      hintText: 'Ingresa tu RUT',
                      onChange: (value) => print,
                      validator: (value) {
                        if (!RutValidator.isValidRut(value!)) {
                          return 'Por favor ingrese un RUT válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                        labelText: 'Correo',
                        hintText: 'Ingresa tu correo',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        onChange: (value) => print,
                        validator: (value) {
                          return value!.length < 3
                              ? 'Por favor ingrese un correo válido'
                              : null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomInputField(
                        labelText: 'Telefono',
                        hintText: 'Ingresa tu telefono',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.number,
                        onChange: (value) => print,
                        validator: (value) {
                          return value!.length < 3
                              ? 'Por favor ingrese un telefono válido'
                              : null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    _isLoading
                        ? const CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          )
                        : Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();

                                  _isLoading = true;

                                  await Future.delayed(
                                      const Duration(seconds: 3));

                                  _isLoading = false;

                                  Navigator.pop(context, LoginScreen.routeName);
                                },
                                child: const Button(label: 'Crear cuenta'),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: AppTheme.primaryColor,
                                    elevation: 0),
                              ),
                              const SizedBox(height: 10,),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Button(label: 'Volver',),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: AppTheme.secondaryColor,
                                    elevation: 0),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Button extends StatelessWidget {
  final String label;

  const Button({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(child: Text(label.toUpperCase())));
  }
}
