import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:login_flutter/screens/home_screen.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/providers/login_form_provider.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/ui/input_decorations.dart';
import 'package:login_flutter/utils/rut_validator.dart';
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
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _LoginForm(),
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
    return RichText(
      text: TextSpan(
          text: '¿No tienes cuenta? ',
          style: const TextStyle(
              fontSize: 15,
              color: AppTheme.secondaryColor,
              fontWeight: FontWeight.w600),
          children: const <TextSpan>[
            TextSpan(
                text: 'Regístrate',
                style: TextStyle(color: AppTheme.primaryColor))
          ],
          recognizer: TapGestureRecognizer()..onTap = () => print('click')),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return ElevatedButton(
      onPressed: () {
        if (!loginForm.isValidForm()) return;
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 15),
          child: Text('Enviar'.toUpperCase())),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: AppTheme.primaryColor,
          elevation: 0),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              cursorColor: AppTheme.primaryColor,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ingresa tu RUT',
                  label: 'RUT',
                  prefixIcon: Icons.person),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => loginForm.rut = value,
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
            TextFormField(
              autocorrect: false,
              cursorColor: AppTheme.primaryColor,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ingresa tu clave',
                  label: 'Clave',
                  prefixIcon: Icons.password),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return value!.length < 4 ? 'La clave no es válida' : null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const SendButton()
          ],
        ),
      ),
    );
  }
}
