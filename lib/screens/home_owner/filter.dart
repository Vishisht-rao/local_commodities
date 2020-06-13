import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int a=-1;
Future<void> openAlert() async{
  return  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context){  
      return AlertDialog(
        title: Text('Sort By'),
        content: Container(
          height: 100.0,
          width: 40.0,
          child: Column(children: <Widget>[
            RaisedButton(
              child: Text('Price - Low to High'),
              onPressed: () {a=0;print(a);},
            ),
             RaisedButton(
              child: Text('Price - High to Low'),
              onPressed: () {a=1;print(a);},
            ),
          ],),
        ),
        actions: <Widget>[
                FlatButton(
                  color: Colors.grey[850],
                  child: Text('DONE',style: TextStyle(color: Colors.white),),
                  onPressed: () {Navigator.pop(context);},
                ),
                FlatButton(
                  color: Colors.grey[850],
                  child: Text('CLEAR ALL',style: TextStyle(color: Colors.white),),
                  onPressed: () {a = -1;Navigator.pop(context);},
                ),
        ],
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton.icon(
            label: Text('Filter',style: TextStyle(color: Colors.grey),),
            icon: Icon(Icons.tune),
            color: Colors.white,
            onPressed: () {openAlert();
            },
          ),
        ],
      ),
    );
  }
}
