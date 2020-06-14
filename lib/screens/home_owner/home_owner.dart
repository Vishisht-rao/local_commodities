import 'package:flutter/material.dart';
import 'package:local_commodities/services/auth.dart';
import 'package:local_commodities/screens/home_owner/owner_settings.dart';
import 'package:local_commodities/screens/home_owner/add_items.dart';

class HomeOwner extends StatefulWidget {
  @override
  _HomeOwnerState createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    } 

    void _showAddItemsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: AddItemsForm(),
        );
      });
    }
    Widget showOrdersPanel() {
      
    }


    return Scaffold
      (backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home Owner'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text('settings'),
            onPressed: () => _showSettingsPanel(),
          )
        ],
      ),
      body: Container(child:
      Column(
        children: <Widget>[
          SizedBox(height:100),
        Padding(
          padding: EdgeInsets.fromLTRB(80,0,80,0),
          child: RaisedButton(
            onPressed:() {
              return _showAddItemsPanel();
            },
          child: Center(child:Text('Add Items',style:TextStyle(color:Colors.white),),),
          elevation:20,
          color: Colors.brown[400],
          splashColor: Colors.redAccent,
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.fromLTRB(80,0,80,0),
          child: RaisedButton(
            onPressed:() {
              return null;
            },
          child: Center(child:Text('Remove Items',style:TextStyle(color:Colors.white),),),
          elevation:20,
          color: Colors.brown[400],
          splashColor: Colors.redAccent,
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.fromLTRB(80,0,80,0),
          child: RaisedButton(
            onPressed:() {
              return null;
            },
          child: Center(child:Text('Change Items',style:TextStyle(color:Colors.white),),),
          elevation:20,
          color: Colors.brown[400],
          splashColor: Colors.redAccent,
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.fromLTRB(80,0,80,0),
          child: RaisedButton(
            onPressed:() {
              return showOrdersPanel();
            },
          child: Center(child:Text('View Orders',style:TextStyle(color:Colors.white),),),
          elevation:20,
          color: Colors.brown[400],
          splashColor: Colors.redAccent,
          ),
        )
                ],)),
      );
      
  }
}

