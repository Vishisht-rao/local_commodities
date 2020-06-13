
import 'package:flutter/material.dart';
import 'package:local_commodities/screens/authenticate/sign_in.dart';
import 'package:local_commodities/screens/home_customer/Objects/items.dart';


class Item extends StatefulWidget {
  int index;
  Item({this.index});
  @override
  _ItemState createState() => _ItemState(index);
}

class _ItemState extends State<Item> {
  int index;
  _ItemState(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: 450.0,
        child: Card(
            elevation: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(child: CircleAvatar(backgroundImage:AssetImage(items[index]['image']),radius:68,),radius:70,backgroundColor:Colors.grey,),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text('Fine Mart\'s',style:TextStyle(fontSize: 7,fontStyle:FontStyle.italic,color: Colors.grey ),),
                      Text(items[index]['name'],style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic )),
                      SizedBox(height: 5,),
                      Text('MRP: Rs ${items[index]['price']} ',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic )),
                      SizedBox(height: 47,),
                      Row(
                        children: <Widget>[
                          Container(child: Center(child: IconButton(icon: Icon(Icons.remove,), onPressed: (){setState(() {
                            items[index]['counter']--;
                          });}, iconSize: 20,color:Colors.white,)),
                            width: 40,height: 40,decoration: BoxDecoration(color:Colors.green,borderRadius:BorderRadius.circular(5) ),),
                          Container(child:Center(child: Text('${items[index]['counter']}')),width: 40,height: 40,color:Colors.grey[200] ,),
                          Container(child: Center(child:IconButton(icon: Icon(Icons.add), onPressed: (){setState(() {
                            items[index]['counter']++;
                          });}, iconSize: 20,color:Colors.white,)),
                            width: 40,height:40,decoration: BoxDecoration(color:Colors.green,borderRadius:BorderRadius.circular(5) ),),
                        ],
                      ),

                    ],
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: new RaisedButton(
                        elevation: 1,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                        color: Colors.green,
                        child: Text( 'Add' , style: TextStyle(fontSize: 20.0, color: Colors.white)),
                        onPressed: () {
                          cart.add(items[index]);
                          print(cart);
                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text(items[index]['name']+'  Added'),duration:Duration(milliseconds:1000),)
                        );
                        }
                    ),
                  )
                ]

            )
        )

    );
  }
}




class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
        child: FlatButton.icon(
          onPressed: () {
            return Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignIn()));
          },
          hoverColor: Colors.white,
          icon: Icon(Icons.supervised_user_circle),
          label: Text('Logout', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          textColor: Colors.white,
        )
    );
  }
}
