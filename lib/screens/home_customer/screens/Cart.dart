import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_commodities/screens/home_customer/Drawer/Drawer.dart';
import 'package:local_commodities/screens/authenticate/sign_in.dart';
import 'package:local_commodities/screens/home_customer/Objects/items.dart';
import 'package:local_commodities/screens/home_customer/screens/address.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
            titleSpacing:0,
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

          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context,index){
                  return Dismissible(
                    key:UniqueKey(),
                    onDismissed:(direction) {
                      setState(() {
                        Map removed = cart.removeAt(index);
                        removed['counter']=0;
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text(removed['name']+'  Deleted'),duration:Duration(milliseconds:1000),)
                        );
                      });
                      },
                    background:Container(
                      color: Colors.green,
                    ),
                    child: Container(
                        height: 180,
                        width: 450.0,
                        child: Card(
                            elevation: 1,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image(image: AssetImage(cart[index]['image']), width: 150,height: 180,),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      Text('Fine Mart\'s',style:TextStyle(fontSize: 7,fontStyle:FontStyle.italic,color: Colors.grey ),),
                                      Text(cart[index]['name'],style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic )),
                                      SizedBox(height: 10,),
                                      Text('MRP: Rs ${cart[index]['price']} ',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic )),
                                      SizedBox(height: 32,),
                                      Row(
                                        children: <Widget>[
                                          Container(child: Center(child: IconButton(icon: Icon(Icons.remove,), onPressed: (){setState(() {
                                            cart[index]['counter']--;
                                          });}, iconSize: 20,color:Colors.white,)),
                                            width: 40,height: 40,decoration: BoxDecoration(color:Colors.green,borderRadius:BorderRadius.circular(5) ),),
                                          Container(child:Center(child: Text('${cart[index]['counter']}')),width: 40,height: 40,color:Colors.grey[200] ,),
                                          Container(child: Center(child:IconButton(icon: Icon(Icons.add), onPressed: (){setState(() {
                                            cart[index]['counter']++;
                                          });}, iconSize: 20,color:Colors.white,)),
                                            width: 40,height:40,decoration: BoxDecoration(color:Colors.green,borderRadius:BorderRadius.circular(5) ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                VerticalDivider(),
                                Container(
                                  color: Colors.green,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('Drag Left to',style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                                      Text('Delete!!',style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                                    Icon(Icons.delete_forever)
                                    ],
                                  )
                                ),
                                ]
                            )
                        )
                    )
                  );
                },
                childCount: cart.length
            ),
          )
        ],
      ),
      drawer: Drawer(
          child:drawer()
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
          width: 400,
          height:50,
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: FloatingActionButton(
            onPressed: () {
               return openAlert();
            },
            backgroundColor: Colors.green,
            shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
            child: Center(child:Text('Checkout',style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold))),
            ),
        ),
      ),
    );
  }
  Future<void> openAlert() async{
  return  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Cart Items '),
        content: Container(
          height: 200.0,
          width: 300.0,
          child: SingleChildScrollView(
            child : Column(
              children: <Widget>[
                Column(
                  children: cart.map((it){
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                            Container(width: 150.0,child: Text(it['name'],style: TextStyle(fontSize: 14.0),)),
                            Container(child: Text('x'+it['counter'].toString(),style: TextStyle(fontSize: 14.0),)),
                            Container(width: 40.0,child: Text('₹'+it['price'].toString(),style: TextStyle(fontSize: 14.0),)),

                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
                FlatButton(
                  color: Colors.green,
                  child: Text('Back To Cart',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  color: Colors.green,
                  child: Text('Proceed to Checkout',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    return Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Address()));
                  },
                ),
        ],
      );
    }
  );
}
}
