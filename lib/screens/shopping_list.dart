import 'package:flutter/material.dart';
import 'package:shopping_list/theme.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});
  @override
  Widget build(BuildContext context) {
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
          width: MediaQuery.widthOf(context),
          height: MediaQuery.heightOf(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [darkPrimaryColor, lightPrimaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemBuilder: (context, int size) {
              //TODO List Item Widget
              return Text(
                "Placeholder",
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
            itemCount: 40,
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
