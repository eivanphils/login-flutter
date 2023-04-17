import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:login_flutter/models/product.dart';
import 'package:login_flutter/screens/screens.dart';
import 'package:login_flutter/services/services.dart';
import 'package:login_flutter/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productService = Provider.of<ProductsService>(context);
    return GestureDetector(
      onTap: () {
        // se realiza una copia del objeto para romper la referencia del mismo
        productService.selectedProduct = product.copy();
        Navigator.pushNamed(context, ProductScreen.routeName);
      },
      child: Container(
        decoration: _cardBorders(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.radius),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
            SizedBox(
                width: 250,
                height: double.infinity,
                child: _BackgroundImage(
                  product.picture,
                )),

            // productName
            _ProductDetail(
              size: size,
              product: product,
            ),

            // price
            _PriceTag(
              size: size,
              product: product,
            ),

            // No available
            if (!product.available) _NotAvailable(size: size)
          ]),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        boxShadow: [AppTheme.boxShadow()],
        borderRadius: BorderRadius.circular(AppTheme.radius),
      );
}

class _BackgroundImage extends StatelessWidget {
  final String? imageUrl;

  const _BackgroundImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(imageUrl.toString()),
        imageErrorBuilder: (BuildContext context, Object obj, stackTrace) =>
            const Image(
              image: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
            ),
        fit: BoxFit.cover);
  }
}

class _ProductDetail extends StatelessWidget {
  final Product product;

  const _ProductDetail({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      padding: const EdgeInsets.only(left: 10),
      width: double.infinity,
      height: size.height * 0.065,
      decoration: _boxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(AppTheme.radius),
      ));
}

class _PriceTag extends StatelessWidget {
  final Product product;

  const _PriceTag({Key? key, required this.size, required this.product})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        height: 40,
        width: size.width * 0.20,
        decoration: _boxDecoration(),
        child: Center(
            child: Text(
          '\$${product.price}',
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(AppTheme.radius),
      ));
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 40,
        width: size.width * 0.25,
        decoration: _boxDecoration(),
        child: const Center(
            child: Text(
          'No disponible',
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
      color: Colors.yellow,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(AppTheme.radius),
      ));
}
