import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_commodities/screens/home_customer/Objects/Items.dart';
import 'package:local_commodities/screens/home_customer/Drawer/Drawer.dart';
import 'package:local_commodities/screens/authenticate/sign_in.dart';
import 'package:local_commodities/screens/home_customer/screens/categoryitem.dart';




class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int catetype;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics:const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 0,
            backgroundColor: Colors.green,
            elevation: 20,
            titleSpacing: 0,
            title: Text('Mathaji Provision Stores'),
            actions: <Widget>[
              FlatButton.icon(onPressed: () {
                return Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
              },
                icon: Icon(Icons.account_circle),
                label: Text('Logout'),
                textColor: Colors.white,),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  child: InkWell(
                    onTap: (){
                      catetype=cate[index]['type'];
                      return Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryItem(catetype:catetype)));
                    },
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(child: CircleAvatar(backgroundImage:AssetImage(cate[index]['image']),radius:98,),radius:102,backgroundColor:Colors.grey,),
                            Text(cate[index]['name'],style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                          ],
                        )
                    ),
                  ),
                );
              },
              childCount:cate.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.90,
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child:drawer()
      ),
    );
  }

}
