import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/Drawer/Account_screen.dart';


class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[

                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    'Mathaji Provision Stores',
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
                    return Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Account_Screen()
                        )
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    return null;
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
