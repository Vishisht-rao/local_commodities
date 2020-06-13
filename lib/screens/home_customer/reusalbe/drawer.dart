import 'package:flutter/material.dart';
import 'package:local_commodities/models/user.dart';
import 'package:local_commodities/screens/home_customer/cart.dart';
import 'package:local_commodities/models/store.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  final Store store;
  const DrawerMenu({Key key,this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[ 

                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.brown[400],
                  ),
                  child: Text(
                    store.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    return null;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('My Account'),
                  onTap: () {
                  
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Cart'),
                  onTap: () {
                    return Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Cart()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    return null;
                  },
                )
              ]
          )
      ,
    );
  }
}