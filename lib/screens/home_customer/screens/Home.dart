import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_customer/screens/Homescreen.dart';
import 'package:local_commodities/screens/home_customer/screens/Categories.dart';
import 'package:local_commodities/screens/home_customer/screens/Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List Body = [Homescreen(), Categories(), Cart(),];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Body[currentindex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        iconSize: 25,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home"),),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("Categories"),),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Cart"),),
        ],
        onTap: (index) {
          setState(() {currentindex = index;});
        },
      ),
    );
  }
}


















