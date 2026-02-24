import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/shopping_item.dart';

final shoppingList = [
  ShoppingItem(
    id: 'a',
    name: 'Milk',
    quantity: 10,
    category: categories[Categories.dairy]!,
  ),
  ShoppingItem(
    id: 'b',
    name: 'Bananas',
    quantity: 24,
    category: categories[Categories.fruit]!,
  ),
  ShoppingItem(
    id: 'c',
    name: 'Beef Steak',
    quantity: 5,
    category: categories[Categories.meat]!,
  ),
];
