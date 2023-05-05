import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import 'package:login_flutter/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-apps-50027-default-rtdb.firebaseio.com';
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final List<Product> products = [];
  // Se le asigna el tipo late ya que luego sera llenada
  late Product selectedProduct;

  File? newPictureFile;
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
    final url = Uri.https(_baseUrl, endpoint, {
      'auth': await storage.read(key: 'idToken') ?? ''
    });
    final response = await http.get(url);

    return response.body;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await _createProduct(product);
    } else {
      await _updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> _updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json', {
      'auth': await storage.read(key: 'idToken') ?? ''
    });

    await http.put(url, body: productToJson(product));

    // find and update the product by id
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> _createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json', {
      'auth': await storage.read(key: 'idToken') ?? ''
    });

    final response = await http.post(url, body: productToJson(product));

    final decodedData = json.decode(response.body);

    // add new product to the List
    product.id = decodedData['name'];
    products.add(product);

    return product.id!;
  }

  Future deleteProduct(String id) async {
    final url = Uri.https(_baseUrl, 'products/$id.json', {
      'auth': await storage.read(key: 'idToken') ?? ''
    });
    final response = await http.delete(url);

    products.removeWhere((element) => element.id == id);

    notifyListeners();
    return response;
  }

  void udpdateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    // set uri
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dq3pkwpe4/image/upload?upload_preset=ml_default');

    // create http method
    final uploadImageRequest = http.MultipartRequest('POST', url);

    // set file into field from
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    // add file into request
    uploadImageRequest.files.add(file);

    // send request
    final streamResponse = await uploadImageRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    // validation of response
    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }

    // decoded response
    final decodedData = json.decode(response.body);
    return decodedData['secure_url'];
  }
}
