import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUri =
      "https://fluttershoppinglist-6fc13-default-rtdb.firebaseio.com/";

  Future<String> postShoppingList(Map<String, String> shoppingItem) async {
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
}
