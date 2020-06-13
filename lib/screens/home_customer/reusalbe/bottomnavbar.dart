import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/cart.dart';
import 'package:local_commodities/screens/home_customer/categories.dart';
import 'package:local_commodities/screens/home_customer/individual_store.dart';
import 'package:local_commodities/models/store.dart';

class BottomBar extends StatefulWidget {

  final Store store;
  BottomBar({this.store});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final data=MediaQuery.of(context);
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        iconSize: (data.size.height/964)*25,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"),),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("Categories"),),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Cart"),),
        ],
        onTap: (index) {
          setState(() {currentindex = index;});
          if (currentindex==0){
            return Navigator.of(context).push(MaterialPageRoute(builder: (context) => IndStore(store: widget.store)));
          }
          if (currentindex==1){
            return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categories()));
          }
          if (currentindex==2){
            return Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(store: widget.store)));       
          }
          },
    );
  }
}