import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_owner/add_items.dart';

class EditItems extends StatefulWidget {
  @override
  _EditItemsState createState() => _EditItemsState();
}

class _EditItemsState extends State<EditItems> {
  @override
  Widget build(BuildContext context) {

    void _showAddItemsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: AddItemsForm(),
        );
      });
    }

    return Container(
      child: Align(
      alignment: Alignment.bottomRight,
      child: RaisedButton(
        onPressed: () => _showAddItemsPanel(),
        child: const Text('Add Item', style: TextStyle(fontSize: 20)),
        color: Colors.brown,
        textColor: Colors.white,
        elevation: 5,
      ),
    ),
    );
  }
}