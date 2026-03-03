import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/models/shopping_item.dart';
import 'package:shopping_list/services/api_service.dart';

final apiServiceProvider = NotifierProvider<NewItemNotifier, ShoppingItem?>(
  NewItemNotifier.new,
);

class NewItemNotifier extends Notifier<ShoppingItem?> {
  @override
  ShoppingItem? build() {
    return null;
  }

  final apiService = ApiService();

  Future<void> newItem(Map<String, String> shoppingItem) async {
    try {
      final postedItemKey = await apiService.postShoppingList(shoppingItem);
      debugPrint(postedItemKey);
    } catch (e) {
      debugPrint('Error $e');
    }
  }
}
