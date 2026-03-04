import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUri = dotenv.env['FIREBASE_URI'];

  Future<String> postShoppingItem(Map<String, String> shoppingItem) async {
    final response = await http.post(
      Uri.parse('$baseUri/shoppingList.json'),
      body: json.encode({
        "name": shoppingItem['name'],
        "quantity": shoppingItem['quantity'],
        "category": shoppingItem['category'],
      }),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['name'];
    } else {
      throw Exception('Failed to Create new item');
    }
  }

  Future<Map<String, dynamic>> getShoppingList() async {
    final response = await http.get(Uri.parse('$baseUri/shoppingList.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data ?? {};
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
