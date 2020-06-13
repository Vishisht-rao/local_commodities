import 'package:flutter/material.dart';
import 'package:local_commodities/models/item.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/models/user.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {

  
  final Item item;
  final Store store;
  ItemTile({ this.item ,this.store});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    String imageLoc = 'Groceries/' + item.image;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0,20.0,0.0),
        child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: (){DatabaseService(uid: user.uid).addToCart(item.name, item.price.toDouble(),item.image,store.name);},
          ),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage(imageLoc),
          ),
          title: Text(item.name),
          subtitle: Text('Rs.' + item.price.toString()),
        )
      ),
    ); 
  }
}