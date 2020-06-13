import 'package:flutter/material.dart';
import 'package:local_commodities/services/auth.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/search.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/drawer.dart';
import 'package:local_commodities/screens/home_customer/reusalbe/bottomnavbar.dart';

class IndStore extends StatefulWidget {
  IndStore({Key key}) : super(key: key);

  @override
  _IndStoreState createState() => _IndStoreState();
}

class _IndStoreState extends State<IndStore> { 
  final AuthService _auth = AuthService();
 @override
  Widget build(BuildContext context) {
    final data=MediaQuery.of(context);
    return SafeArea(
          child: Scaffold(
        drawer: Drawer(child: DrawerMenu()), 
        body:CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              expandedHeight: (data.size.height/7),
              backgroundColor: Colors.brown[400],
              elevation: 20,
              title: Center(child: Text('Store name')),
              flexibleSpace: FlexibleSpaceBar(
              background: Row(
              children: <Widget>[
              Expanded(
              child: Search()
              ),
              Padding(
              padding: EdgeInsets.fromLTRB(5,(data.size.height/15), 5, 0),
              child: FlatButton.icon(
              padding:EdgeInsets.all(10) ,
              onPressed: () {
                       
              },
              hoverColor: Colors.white,
              icon: Icon(Icons.filter_list),
              label: Text('Filter', style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold)),textColor: Colors.white,
              )
              ),
              ],
              )),
              actions: <Widget>[
                Padding(
                padding:EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  },
                icon: Icon(Icons.person),
                label: Text('Logout', style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)),textColor: Colors.white,
                )
              )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

