import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [_boxShadow()]),
        child: child,
      ),
    );
  }

  BoxShadow _boxShadow() {
    return const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 4,
        spreadRadius: 1,
        offset: Offset(0, 1.5));
  }
}
