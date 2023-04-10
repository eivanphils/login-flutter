import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:login_flutter/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-apps-50027-default-rtdb.firebaseio.com';

  final List<Product> products = [];
  // Se le asigna el tipo late ya que luego sera llenada
  late Product selectedProduct;
  bool isLoading = false;
  bool isSaving = false;

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

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      // TODO: create new product

    } else {
      final id = await _updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> _updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');

    final response = await http.put(url, body: productToJson(product));

    final decodedData = response.body;

    // find and update the product by id
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }
}
