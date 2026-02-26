import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  String? inputValidator(String? value, String title) {
    if (value == null || value.isEmpty) {
      return 'Please enter $title';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
            initialSelection: Categories.carbs,
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
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
