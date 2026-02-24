import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/providers/shopping_list_provider.dart';
import 'package:shopping_list/theme.dart';

import '../widgets/shopping_list_item.dart';

class ShoppingList extends ConsumerWidget {
  const ShoppingList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(shoppingListProvider);
    return SafeArea(
      minimum: EdgeInsets.only(top: 30),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Shopping List",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [darkPrimaryColor, lightPrimaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            padding: EdgeInsets.all(20),
            itemBuilder: (context, int index) {
              return ShoppingListItem(shoppingItem: listProvider[index]);
            },
            itemCount: listProvider.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
