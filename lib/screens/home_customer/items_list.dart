import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/item.dart';
import 'package:local_commodities/screens/home_customer/item_tile.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {

    final items = Provider.of<List<Item>>(context) ?? [];
    
 
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        print(items[index]);
        return ItemTile(item: items[index]);
      },
    );
  }
}