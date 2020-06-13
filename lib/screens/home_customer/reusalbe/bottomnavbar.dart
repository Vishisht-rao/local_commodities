import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/individual_store.dart';
import 'package:local_commodities/screens/home_customer/cart.dart';
import 'package:local_commodities/screens/home_customer/categories.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List Body = [IndStore(), Categories(), Cart(),];
    final data=MediaQuery.of(context);
    int currentindex = 0;
    return BottomNavigationBar(
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        iconSize: (data.size.height/964)*25,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"),),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("Categories"),),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Cart"),),
        ],
        onTap: (index) {
          setState(() {currentindex = index;});
          return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Body[currentindex]));
        },
    );
  }
}