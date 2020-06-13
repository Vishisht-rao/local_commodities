import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/screens/home_customer/store_tile.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) { 

    final listOfStores = Provider.of<List<Store>>(context) ?? [];
    
 
    return ListView.builder(
      itemCount: listOfStores.length,
      itemBuilder: (context,index) {
        return StoreTile(store: listOfStores[index]);
      },
    );
  }
}