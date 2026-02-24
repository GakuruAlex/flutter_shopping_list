import 'package:flutter/material.dart';
import '../models/category.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category('Fruits', Color.fromARGB(255, 145, 255, 0)),
  Categories.meat: Category('Meat', Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy: Category('Dairy', Color.fromARGB(255, 0, 208, 255)),
  Categories.carbs: Category('Carbs', Color.fromARGB(255, 0, 60, 255)),
};
