import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/providers/providers.dart';

void main() {
  runApp(
    const AppState());
}

class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService()),
        ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: CheckAuthScreen.routeName,
      routes: {
        CheckAuthScreen.routeName: (_) => const CheckAuthScreen(),

        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProductScreen.routeName: (_) => const ProductScreen(),
      },
      theme: AppTheme.lightTheme
    );
  }
}