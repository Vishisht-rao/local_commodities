import 'package:flutter/material.dart';
import 'package:local_commodities/screens/home_owner/edit_items.dart';
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
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
        onPressed: () => _showAddItemsPanel(),
      ),
      );
      
  }
}


/*class HomeOwner extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.brown[50],
      appBar: AppBar(
        title: Text('Home Owner'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Logout'),
          ),
        ],
      ),
    );
  }
}*/