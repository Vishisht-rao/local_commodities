import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  Address({Key key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.green,
          title: Text('Mathaji Provision Stores'),
        ) ,
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
