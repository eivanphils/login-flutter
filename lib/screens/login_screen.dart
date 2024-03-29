import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/providers/providers.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/utils/rut_validator.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:login_flutter/utils/utils.dart';

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
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      'Bienvenido nuevamente',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const RegisterText()
          ],
        ),
      ),
    ));
  }
}

class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RegisterScreen.routeName),
      child: RichText(
        text: const TextSpan(
          text: '¿No tienes cuenta? ',
          style: TextStyle(
              fontSize: 15,
              color: AppTheme.secondaryColor,
              fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
                text: 'Regístrate',
                style: TextStyle(color: AppTheme.primaryColor))
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthService>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            CustomInputField(
              prefixIcon: Icons.person,
              labelText: 'RUT',
              hintText: 'Ingresa tu RUT',
              onChange: (value) => loginForm.rut = value!,
              validator: (value) {
                if (!RutValidator.isValidRut(value!)) {
                  return 'Por favor ingrese un RUT válido';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),

            CustomInputField(
                labelText: 'Correo',
                hintText: 'Ingresa tu correo',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onChange: (value) => loginForm.email = value!,
                validator: (value) {
                  return !EmailValidator.isValid(value)
                      ? 'Por favor ingrese un correo válido'
                      : null;
                }),

            const SizedBox(
              height: 12,
            ),

            CustomInputField(
              prefixIcon: Icons.password,
              labelText: 'Clave',
              hintText: 'Ingresa tu clave',
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 6,
              maxLine: 1,
              onChange: (value) => loginForm.password = value!,
              validator: (value) {
                return value!.length < 6 ? 'La clave no es válida' : null;
              },
            ),

            const SizedBox(
              height: 30,
            ),
            loginForm.isLoading
                ? const CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (!loginForm.isValidForm()) return;

                      loginForm.isLoading = true;
                      
                      final String? errorMessage =
                            await authService.loginUser(
                                loginForm.email, loginForm.password);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertMessage(errorMessage));
                        }

                      loginForm.isLoading = false;
                      
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 85, vertical: 15),
                        child: Text('Enviar'.toUpperCase())),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)), backgroundColor: AppTheme.primaryColor,
                        elevation: 0),
                  )
          ],
        ),
      ),
    );
  }
}
