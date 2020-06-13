import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Form Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//globalkey
//email, password variable
//form
//textformfield
//submit

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        
        body: Container(
            width : double.infinity,
            height:  double.infinity,
            
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Address", style: TextStyle(color: Colors.green, fontSize: 40,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      //Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
               ),
              ),
              Form(
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      decoration: InputDecoration(hintText: 'Locality',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      ),
                      ),
                    SizedBox(height: 15,),
                      TextFormField(
                      decoration: InputDecoration(hintText: 'Street details to locate you',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      ),
                      ),
                    SizedBox(height: 15,),
                      TextFormField(
                      decoration: InputDecoration(hintText: 'House no',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      ),
                      ),
                    SizedBox(height: 15,),
                      TextFormField(
                      decoration: InputDecoration(hintText: 'Apartment name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      ),
                      ),

                    SizedBox(height: 30,),


                    RaisedButton(
                      color: Colors.green,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white,fontSize: 20.0, fontWeight: FontWeight.bold,),
                      ),
                      onPressed: () {}
                      ),
                      
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
