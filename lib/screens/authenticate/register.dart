import 'package:flutter/material.dart';
import 'package:local_commodities/services/auth.dart';
import 'package:local_commodities/shared/constants.dart';
import 'package:local_commodities/shared/loading.dart';
import 'package:local_commodities/services/database.dart';

class Register extends StatefulWidget {

  final Function toggleView; 
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final List<String> userType = ['Customer','Store Owner','Delivery Executive'];
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

String _currentUserType;
String _currentName;

//text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ]
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) => val.isEmpty ? 'Enter your name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                value: userType[0],
                decoration: textInputDecoration,
                items: userType.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text('$type'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentUserType = val ),
              ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                      await DatabaseService(uid: result.uid).addUserTypeandName(
                      _currentUserType ?? userType[0],
                      _currentName,
                    );
                    if(_currentUserType == 'Store Owner') {
                      await DatabaseService(uid: result.uid).addStoreInfo('store_name', 'store_address', result.uid);
                    }
                      if (result == null) {
                        setState(() {
                           error = 'Invalid email or account already exists';
                           loading = false;
                      });
                    }}
                  }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
    );
  }
}