import 'package:flutter/material.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/drawer.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/bottomnavbar.dart';
import 'package:local_commodities/screens/home_delivery/checkout_pop_up.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/item.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/screens/home_customer/cart_tile.dart';
import 'package:local_commodities/models/user.dart';

class Cart extends StatefulWidget {

  final Store store;

  Cart({this.store});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentindex=2;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamProvider<List<CartModel>>.value(
      value: DatabaseService(uid: user.uid+widget.store.name).cartItems,
    child: SafeArea(
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
              title: Text(widget.store.name),
              actions: <Widget>[
              ]
            ),
            SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final products = Provider.of<List<CartModel>>(context) ?? [];

                  //print(items[index]);
                  return CartTile(cart: products[index],store: widget.store);
                },
                childCount: products.length
            ),
            )
          ],
        ),
        drawer: Drawer(
            child:DrawerMenu()
        ),
        bottomNavigationBar: BottomBar(),
      ),
    ),
    );
  }
}