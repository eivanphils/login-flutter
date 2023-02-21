import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:login_flutter/widgets/widgets.dart';

class CardSwiper extends StatelessWidget {
  const   CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.25,
        itemBuilder: (BuildContext context, int index) {
          return CardProduct(productId: index,);
        },
      ),
    );
  }
}
