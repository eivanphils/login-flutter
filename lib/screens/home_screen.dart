import 'package:flutter/material.dart';

import 'package:login_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CardSwiper(),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('Productos Destacados'),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, int index) {
                  return Container(
                    width: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: CardProduct(
                      productId: index,
                    )
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
