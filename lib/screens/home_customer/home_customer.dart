import 'package:flutter/material.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/services/auth.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/search.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/drawer.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/bottomnavbar.dart';
import 'package:local_commodities/services/database.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/screens/home_customer/stores_list.dart';

class HomeCustomer extends StatefulWidget {
  HomeCustomer({Key key}) : super(key: key);

  @override
  _HomeCustomerState createState() => _HomeCustomerState(); 
}

class _HomeCustomerState extends State<HomeCustomer> { 
 
  final AuthService _auth = AuthService();

 @override
  Widget build(BuildContext context) {
      return StreamProvider<List<Store>>.value(
        value: DatabaseService().shops,
          child: Scaffold
      (backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home Customer'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: StoreList(),
      ),
    );
  }
}