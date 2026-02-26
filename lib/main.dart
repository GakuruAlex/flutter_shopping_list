import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/screens/shopping_list.dart';
import 'package:shopping_list/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopping List',
      theme: themeData,
      home: Container(
        margin: EdgeInsetsGeometry.only(top: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [darkPrimaryColor, lightPrimaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ShoppingList(),
      ),
    );
  }
}
