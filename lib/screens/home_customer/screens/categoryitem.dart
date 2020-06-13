import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_commodities/screens/home_customer/screens/Search.dart';
import 'package:local_commodities/screens/home_customer/Objects/Items.dart';
import 'package:local_commodities/screens/home_customer/Objects/reusable.dart';
import 'package:local_commodities/screens/home_customer/Drawer/Drawer.dart';
import 'package:local_commodities/screens/authenticate/sign_in.dart';
import 'package:local_commodities/screens/home_customer/screens/Home.dart';


class CategoryItem extends StatefulWidget {
  int catetype;
  CategoryItem({this.catetype});
  @override
  _CategoryItemState createState() => _CategoryItemState(catetype);
}

class _CategoryItemState extends State<CategoryItem> {
  int catetype;

  _CategoryItemState(this.catetype);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 110,
            backgroundColor: Colors.green,
            elevation: 20,
            titleSpacing:0,
            title: Text('Mathaji Provision Stores'),
            flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  children: <Widget>[
                    Expanded(child: Search()),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 120, 3, 0),
                        child: FlatButton.icon(
                          onPressed: () {
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
              FlatButton.icon(onPressed: () {
                return Navigator.of(context).push(MaterialPageRoute(builder: (
                    context) => SignIn()));
              },
                icon: Icon(Icons.account_circle),
                label: Text('Logout'),
                textColor: Colors.white,),
            ],
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (items[index]['type'] == catetype) {
                    return Item(index: index);
                  }
                  else {
                    return Container();
                  }
                },
                childCount: items.length
            ),
          )
        ],
      ),
      drawer: Drawer(child: drawer()),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0),
        child: RaisedButton(
          onPressed: () {
            return Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Home()));
            },
          color: Colors.green,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.arrow_back, size: 41,),
              Text('Back To Categories', style: TextStyle(fontSize: 41, fontStyle: FontStyle.italic),),
            ],
          ),
        ),
      ),
    );
  }
}

