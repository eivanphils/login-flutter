import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:login_flutter/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-apps-50027-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  void loadProducts() async {
    final jsonData = await _getJsonData('products.json');

    final Map<String, dynamic> productsMap = json.decode(jsonData);

    productsMap.forEach((key, value) {
      final product = Product.fromJson(value);
      product.id = key;

      products.add(product);
    });

    print(productsMap);
    _endConsult();
  }

  Future<Product> getProductById(String id) async {
    final jsonData = await _getJsonData('$id.json');
    final productResponse = productFromJson(jsonData);
    _endConsult();

    return productResponse;
  }

  void _endConsult() {
    isLoading = false;
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint);
    final response = await http.get(url);

    return response.body;
  }
}
