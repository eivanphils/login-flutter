import 'dart:io';

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
          child: getImage(imageUrl),
        ),
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null) {
      return const Image(
        image: AssetImage('assets/no-image.jpg'),
        fit: BoxFit.cover,
      );
    }

    if (picture.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(picture),
        placeholder: const AssetImage('assets/loading.gif'),
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
      color: Colors.black,
      boxShadow: [AppTheme.boxShadow()],
      borderRadius: _bottomBorderRadius());

  BorderRadius _bottomBorderRadius() {
    return const BorderRadius.only(
        bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45));
  }
}
