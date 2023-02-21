import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final int productId;
  const CardProduct({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/200x200'),
          fit: BoxFit.cover),
    );
    ;
  }
}
