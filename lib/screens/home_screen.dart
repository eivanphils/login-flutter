import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/models/models.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    // no necesito estar escuchando
    final authService = Provider.of<AuthService>(context, listen: false);
    final List<Product> products = productsService.products;

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {

              authService.logout();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(products),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('Productos Destacados'),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, int index) {
                  return Container(
                      width: 250,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: CardProduct(products[index]));
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              Product(available: true, description: '', name: '', price: 0);
          Navigator.pushNamed(context, ProductScreen.routeName);
        },
      ),
    );
  }
}
