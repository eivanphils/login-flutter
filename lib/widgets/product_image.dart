import 'package:flutter/material.dart';

import 'package:login_flutter/theme/app_theme.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;

  const ProductImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      decoration: _boxDecoration(),
      child: Opacity(
        opacity: 0.85,
        child: ClipRRect(
          borderRadius: _bottomBorderRadius(),
          child: FadeInImage(
            image: NetworkImage(imageUrl.toString()),
            placeholder: const AssetImage('assets/loading.gif'),
            imageErrorBuilder: (BuildContext context, Object obj, stackTrace) =>
                const Image(
              image: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.black,
      boxShadow: [AppTheme.boxShadow()], borderRadius: _bottomBorderRadius());

  BorderRadius _bottomBorderRadius() {
    return const BorderRadius.only(
        bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45));
  }
}
