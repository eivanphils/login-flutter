import 'package:flutter/material.dart';

import 'package:login_flutter/theme/app_theme.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      decoration: _boxDecoration(),
      child: ClipRRect(
        borderRadius: _bottomBorderRadius(),
        child: const FadeInImage(
          // image: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('https://via.placeholder.com/400x300/green'),
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    boxShadow: [AppTheme.boxShadow()],
    borderRadius: _bottomBorderRadius()
  );

  BorderRadius _bottomBorderRadius() {
    return const BorderRadius.only(
        bottomLeft: Radius.circular(45),
        bottomRight: Radius.circular(45)
      );
  }

}
