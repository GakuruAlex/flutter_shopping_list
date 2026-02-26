import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/shopping_items_data.dart';
import 'package:shopping_list/models/category.dart';
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

  void addNewItem({
    required String name,
    required double quantity,
    required Category category,
  }) {
    final lastItemId = state[state.length - 1].id.codeUnitAt(0);
    final newID = String.fromCharCode(lastItemId + 1);

    state = [
      ...state,
      ShoppingItem(
        id: newID,
        name: name,
        quantity: quantity,
        category: category,
      ),
    ];
  }
}
