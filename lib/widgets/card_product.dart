import 'package:flutter/material.dart';

import 'package:login_flutter/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  final int productId;
  const CardProduct({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _cardBorders(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radius),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const SizedBox(
              height: double.infinity,
              child: _BackgroundImage()
            ),

            // productName
            _ProductDetail(size: size),

            // price
            _PriceTag(size: size),

            // No available
            _NotAvailable(size: size)
          ]
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
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FadeInImage(
      placeholder: AssetImage('assets/loading.gif'),
      image: NetworkImage('https://via.placeholder.com/200x200'),
      fit: BoxFit.cover
    );
  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({
    Key? key,
    required this.size,
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
        children: const [
          Text(
            'Iphone 10',
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'descripcion general',
            style: TextStyle(fontSize: 15, color: Colors.white,),
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
    )
  );
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
    required this.size,
  }) : super(key: key);

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
        child: const Center(
          child: Text(
            '\$100.000',
            style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          )
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: AppTheme.primaryColor,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(AppTheme.radius),
    )
  );
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
            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
          )
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(AppTheme.radius),
    )
  );
}
