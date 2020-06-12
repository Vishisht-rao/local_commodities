import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import './item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

final List<Item> products = [
    Item(
      brand: 'FRESHO',
      name: 'Apple - Red Washington',
      price: 60,
      image:'asset/apple.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pomegranate',
      price: 80,
      image:'asset/pomegranate.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),Item(
      brand: 'FRESHO',
      name: 'Apple - Red Washington',
      price: 60,
      image:'asset/apple.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pomegranate',
      price: 80,
      image:'asset/pomegranate.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Apple - Red Washington',
      price: 60,
      image:'asset/apple.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pomegranate',
      price: 80,
      image:'asset/pomegranate.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Apple - Red Washington',
      price: 60,
      image:'asset/apple.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pomegranate',
      price: 80,
      image:'asset/pomegranate.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
  ];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                  children: products.map((it){
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          
                            Container(width: 150.0,child: Text(it.name,style: TextStyle(fontSize: 14.0),)),
                            Container(child: Text('x2',style: TextStyle(fontSize: 14.0),)),
                            Container(width: 40.0,child: Text('₹'+it.price.toString(),style: TextStyle(fontSize: 14.0),)),

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
                  color: Colors.purple[900],
                  child: Text('Back To Cart',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  color: Colors.purple[900],
                  child: Text('Proceed to Checkout',style: TextStyle(color: Colors.white),),
                  onPressed: () {},
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
          FlatButton(
            child: Text('CHECKOUT',style: TextStyle(color: Colors.white),),
            color: Colors.purple[900],
            onPressed: () {openAlert();
            },
          ),
        ],
      ),
    );
  }
}
