import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _GreenBox(),
          const _HeaderIcon(),
          child
        ],
      ),
    );
  }


}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        child: const Image(
          image: AssetImage('assets/logo-klap.png'),
          height: 100,
        ),
      ),
    );
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _greenBackground(),
      child: Stack(
        children: const [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: 40,
            left: 180,
          ),
          Positioned(
            child: _Bubble(),
            top: 300,
            left: 190,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 60,
            right: -60,
          ),
        ],
      ),
    );
  }

  BoxDecoration _greenBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(38, 208, 124, 1),
        Color.fromRGBO(0, 194, 135, 1),
        Color.fromRGBO(0, 179, 143, 1),
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.11)),
    );
  }
}
