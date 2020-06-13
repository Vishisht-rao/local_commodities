import 'package:flutter/material.dart';
import 'package:local_commodities/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/store.dart';
import 'package:local_commodities/models/user.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentAddress;

 
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<Store>(
       stream: DatabaseService(uid: user.uid).store,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Store store = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
            children: <Widget>[
              Text(
                'Update your store settings',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: store.name,
                decoration: textInputDecoration.copyWith(hintText: 'Store name'),
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: store.address,
                decoration: textInputDecoration.copyWith(hintText: 'Store address'),
                validator: (val) => val.isEmpty ? 'Please enter an address' : null,
                onChanged: (val) => setState(() => _currentAddress = val),
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    await DatabaseService(uid: DatabaseService(uid: user.uid).getName()).addStoreInfo(
                      _currentName ?? store.name,
                      _currentAddress ?? store.address,
                      DatabaseService(uid: user.uid).getName() + '.jpg',
                    );
                    Navigator.pop(context);
                  }
                }
              ),
            ],
          ),
        );
        }
        else {
          return Loading();
        }
      }
          );
        
      

    
  }
}