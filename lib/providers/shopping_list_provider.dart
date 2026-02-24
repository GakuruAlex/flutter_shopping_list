import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/shopping_items_data.dart';
import 'package:shopping_list/models/shopping_item.dart';

final shoppingListProvider =
    NotifierProvider<ShoppingListNotifier, List<ShoppingItem>>(
      ShoppingListNotifier.new,
    );

class ShoppingListNotifier extends Notifier<List<ShoppingItem>> {
  @override
  List<ShoppingItem> build() {
    return shoppingList;
  }
}
