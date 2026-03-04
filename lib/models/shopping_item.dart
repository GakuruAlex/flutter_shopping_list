import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';

class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> data) => ShoppingItem(
    id: data['id'],
    name: data['name'],
    quantity: double.parse(data['quantity']),
    category:
        categories[Categories.values.byName(data['category'].toLowerCase())]!,
  );
  final String id;
  final String name;
  final double quantity;
  final Category category;
}
