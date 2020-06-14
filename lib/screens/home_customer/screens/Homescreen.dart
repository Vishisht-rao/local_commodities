import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_commodities/screens/home_customer/Drawer/Drawer.dart';
import 'package:local_commodities/screens/authenticate/sign_in.dart';
import 'package:local_commodities/screens/home_customer/screens/Search.dart';
import 'package:local_commodities/screens/home_customer/Objects/Items.dart';
import 'package:local_commodities/screens/home_customer/Objects/reusable.dart';
import 'package:local_commodities/services/auth.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
 final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight:110,
            backgroundColor: Colors.green,
            elevation: 20,
            titleSpacing:0,
            title: Text('Mathaji Provision Stores'),
            flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  children: <Widget>[
                    Expanded(
                        child: Search()
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5,120, 5, 0),
                        child: FlatButton.icon(
                          onPressed: () async {
                            await _auth.signOut();                        
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
              
                          },
                          hoverColor: Colors.white,
                          icon: Icon(Icons.filter_list),
                          label: Text('Filter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          textColor: Colors.white,
                        )
                    ),
                  ],
                )),
            actions: <Widget>[
              login()
            ],
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Item(index: index);
                },
                childCount: items.length
            ),
          )
        ],
      ),
      drawer: Drawer(
          child: drawer()
      ),
    );
  }
}



