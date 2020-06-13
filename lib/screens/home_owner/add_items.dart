import 'package:flutter/material.dart';
import 'package:local_commodities/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/shared/constants.dart';
import 'package:local_commodities/models/user.dart';

class AddItemsForm extends StatefulWidget {
  @override
  _AddItemsFormState createState() => _AddItemsFormState();
}

class _AddItemsFormState extends State<AddItemsForm> {

  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentName;
  String _currentPrice;
  String _currentType;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Form(
      key: _formKey,
            child: Column(
            children: <Widget>[
              Text(
                'Enter Item Data',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: null,
                decoration: textInputDecoration.copyWith(hintText: 'Item name'),
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: null,
                decoration: textInputDecoration.copyWith(hintText: 'Price'),
                validator: (val) => val.isEmpty ? 'Please enter a price' : null,
                onChanged: (val) => setState(() => _currentPrice = val),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: null,
                decoration: textInputDecoration.copyWith(hintText: 'Category'),
                validator: (val) => val.isEmpty ? 'Please enter a category' : null,
                onChanged: (val) => setState(() => _currentType = val),
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).addItemData(
                      _currentName,
                      _currentPrice,
                      _currentType,
                    );
                    Navigator.pop(context);
                  }
                }
              ),
            ],
          ),
        
    );
  }
}