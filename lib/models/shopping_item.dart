import 'package:shopping_list/models/category.dart';

class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
  final String id;
  final String name;
  final double quantity;
  final Category category;
}
