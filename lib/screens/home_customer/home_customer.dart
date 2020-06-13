import 'package:flutter/material.dart';
import 'package:local_commodities/services/auth.dart';

class HomeCustomer extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.brown[50],
      appBar: AppBar(
        title: Text('Home Customer'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}