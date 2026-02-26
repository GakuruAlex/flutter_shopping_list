import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/providers/shopping_list_provider.dart';

import '../models/category.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({super.key});

  @override
  ConsumerState<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends ConsumerState<NewItem> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  Categories _categoryController = Categories.carbs;

  String? inputValidator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return 'Please enter $title';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingListNotifier = ref.read(shoppingListProvider.notifier);
    return Form(
      key: _formKey,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [
              Expanded(
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text('Name')),
                  validator: (value) {
                    return inputValidator(value, 'Name');
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text('Quantity')),
                  validator: (value) {
                    return inputValidator(value, 'Quantity');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          DropdownMenu(
            label: Text('Category'),
            onSelected: (value) => _categoryController = value!,
            initialSelection: _categoryController,
            dropdownMenuEntries: Categories.values.map((category) {
              return DropdownMenuEntry<Categories>(
                value: category,
                label: category.name,
              );
            }).toList(),
          ),

          Spacer(),
          Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: FloatingActionButton.extended(
              label: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  shoppingListNotifier.addNewItem(
                    name: _nameController.text.trim(),
                    quantity: double.parse(_quantityController.text.trim()),
                    category: categories[_categoryController]!,
                  );
                  _formKey.currentState!.reset();
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
