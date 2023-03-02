import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:login_flutter/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-apps-50027-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  bool isLoading = false;

  ProductsService() {
    loadProducts();
  }

  void loadProducts() async {
    _notifyConsult(true);

    final jsonData = await _getJsonData('products.json');

    final Map<String, dynamic> productsMap = json.decode(jsonData);

    productsMap.forEach((key, value) {
      final product = Product.fromJson(value);
      product.id = key;

      products.add(product);
    });

    _notifyConsult(false);
  }

  Future<Product> getProductById(String id) async {
    _notifyConsult(true);

    final jsonData = await _getJsonData('$id.json');
    final productResponse = productFromJson(jsonData);
    _notifyConsult(false);

    return productResponse;
  }

  void _notifyConsult(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint);
    final response = await http.get(url);

    return response.body;
  }
}
