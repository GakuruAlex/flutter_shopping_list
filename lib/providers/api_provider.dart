import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/models/shopping_item.dart';
import 'package:shopping_list/services/api_service.dart';

final apiPostServiceProvider = AsyncNotifierProvider<NewItemNotifier, String?>(
  NewItemNotifier.new,
);

final shoppingItemsProvider =
    AsyncNotifierProvider<ShoppingListNotifier, List<ShoppingItem>>(
      ShoppingListNotifier.new,
    );

class ShoppingListNotifier extends AsyncNotifier<List<ShoppingItem>> {
  final apiService = ApiService();

  @override
  Future<List<ShoppingItem>> build() async {
    return _fetchShoppingList();
  }

  Future<List<ShoppingItem>> _fetchShoppingList() async {
    final data = await apiService.getShoppingList();

    final List<ShoppingItem> items = [];

    data.forEach((key, value) {
      items.add(
        ShoppingItem.fromJson({
          'id': key, // firebase key
          ...value,
        }),
      );
    });

    return items;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(_fetchShoppingList);
  }
}

class NewItemNotifier extends AsyncNotifier<String?> {
  final apiService = ApiService();

  @override
  String? build() => null;

  Future<void> newItem(Map<String, String> shoppingItem) async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(
      () => apiService.postShoppingItem(shoppingItem),
    );

    if (!ref.mounted) return;

    state = result;
    ref.invalidate(shoppingItemsProvider);
  }
}
