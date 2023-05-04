import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _apiKey = 'AIzaSyDWBmKpajLT0t9WJmZgylaaevAHw2q0p0I';

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    // create Map to send body data
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _apiKey});

    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponde = json.decode(response.body);

    print(decodedResponde);
    if (decodedResponde.containsKey('idToken')) {
      storage.write(key: 'idToken', value: decodedResponde['idToken']);
      return null;
    } else {
      return decodedResponde['error']['message'];
    }
  }

  Future<String?> loginUser(String email, String password) async {
    // create Map to send body data
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _apiKey});

    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponde = json.decode(response.body);

    print(decodedResponde);
    if (decodedResponde.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: decodedResponde['idToken']);
      return null;
    } else {
      return decodedResponde['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
  }

  Future<String> isLogged() async {
    return await storage.read(key: 'idToken') ?? '';
  }
}
