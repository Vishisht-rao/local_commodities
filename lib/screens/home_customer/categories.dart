import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/bottomnavbar.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/drawer.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentindex=1;
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
                
              ],
            ),          
          ],
        ),
        drawer: Drawer(
           child: DrawerMenu() 
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

}