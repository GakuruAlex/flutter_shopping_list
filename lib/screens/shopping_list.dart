import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/providers/api_provider.dart';
import 'package:shopping_list/theme.dart';
import 'package:shopping_list/widgets/new_item.dart';

import '../widgets/shopping_list_item.dart';

class ShoppingList extends ConsumerWidget {
  const ShoppingList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(shoppingItemsProvider);
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
          child: listProvider.when(
            data: (items) => ListView.separated(
              itemBuilder: (context, int index) {
                return ShoppingListItem(shoppingItem: items[index]);
              },
              padding: EdgeInsets.all(20),

              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemCount: items.length,
            ),
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error $err'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => NewItem()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
