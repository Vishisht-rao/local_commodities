import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/drawer.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/bottomnavbar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentindex=2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: CustomScrollView(
          physics:const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              expandedHeight: 0,
              backgroundColor: Colors.brown[400],
              elevation: 20,
              titleSpacing: 80,
              title: Text('Store Name'),
              actions: <Widget>[
              ]
            ),
            
          ],
        ),
        drawer: Drawer(
            child:DrawerMenu()
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}