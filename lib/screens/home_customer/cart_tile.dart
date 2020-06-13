import 'package:flutter/material.dart';
import 'package:local_commodities/models/item.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/models/user.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {

  
  final CartModel cart;
  final Store store;
  CartTile({ this.cart ,this.store});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

  
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0,20.0,0.0),
        child: ListTile(
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
          ),
          title: Text(cart.name),
          subtitle: Text('Rs.' + cart.price.toString()),
        )
      ),
    ); 
  }
}