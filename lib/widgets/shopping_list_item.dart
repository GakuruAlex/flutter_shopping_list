import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopping_item.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({super.key, required this.shoppingItem});
  final ShoppingItem shoppingItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        Container(width: 20, height: 20, color: shoppingItem.category.color),
        SizedBox(width: 30),
        Text(shoppingItem.name, style: Theme.of(context).textTheme.bodyMedium),
        Spacer(),
        Text(
          shoppingItem.quantity.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
