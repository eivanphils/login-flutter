import 'package:flutter/material.dart';

import 'package:login_flutter/models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  // Se debe crear o se reciba la instacia del provider se debe enviar un producto
  ProductFormProvider(this.product);

  void updateAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(product.name);
    print(product.description);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate() ?? false;
  }
}
