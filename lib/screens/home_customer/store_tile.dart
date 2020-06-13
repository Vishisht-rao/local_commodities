import 'package:flutter/material.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/screens/home_customer/individual_store.dart';

class StoreTile extends StatelessWidget {

  final Store store;
  StoreTile({ this.store });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0,20.0,0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[400],
            backgroundImage: AssetImage(store.imageLoc),
          ),
          title: Text(store.name),
          subtitle: Text(store.address),
        )
      ),
    ); 
  }
}