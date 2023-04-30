import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/utils/utils.dart';
import 'package:login_flutter/widgets/widgets.dart';
import 'package:login_flutter/providers/providers.dart';
import 'package:login_flutter/services/services.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 210,
            ),
            CardContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: _RegisterForm(),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    final authService = Provider.of<AuthService>(context);

    return Form(
      key: registerForm.formKey,
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
              onChange: (value) => registerForm.name = value!,
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
              onChange: (value) => registerForm.lastName = value!,
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
            onChange: (value) => registerForm.rut = value!,
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
              onChange: (value) => registerForm.email = value!,
              validator: (value) {
                return !EmailValidator.isValid(value)
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
              onChange: (value) => registerForm.phone = int.parse(value!),
              validator: (value) {
                return value!.length < 3
                    ? 'Por favor ingrese un telefono válido'
                    : null;
              }),
          const SizedBox(
            height: 15,
          ),
          CustomInputField(
            prefixIcon: Icons.password,
            labelText: 'Clave',
            hintText: 'Ingresa tu clave',
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            maxLine: 1,
            onChange: (value) => registerForm.password = value!,
            validator: (value) {
              return value!.length < 4 ? 'La clave no es válida' : null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          registerForm.isLoading
              ? const CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                )
              : Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        // si utilizo la instancia del provider dentro de un metodo el listen debe ir en false
                        // final authService = Provider.of<AuthService>(context, listen: false);
                        //en caso contrario puede ir en true cuando se crea desde el build

                        if (!registerForm.isValidForm()) return;

                        registerForm.isLoading = true;

                        // TODO: cambiar el delayed por el registro de usuario
                        final String? errorMessage =
                            await authService.createUser(
                                registerForm.email, registerForm.password);

                        if (errorMessage == null) {
                          Navigator.pop(context, LoginScreen.routeName);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertMessage(errorMessage));
                        }
                        registerForm.isLoading = false;
                      },
                      child: const Button(label: 'Crear cuenta'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: AppTheme.primaryColor,
                          elevation: 0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Button(
                        label: 'Volver',
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
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
