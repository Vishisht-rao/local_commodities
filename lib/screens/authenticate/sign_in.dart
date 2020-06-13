import 'package:local_commodities/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:local_commodities/shared/constants.dart';
import 'package:local_commodities/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        body: Container(
            width : double.infinity,
            height:  double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter,colors:[Colors.orange[900],Colors.orange[800],Colors.orange[400]])
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                ),
                SizedBox(height: 10),


              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      }
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'incorrect email or password';
                              loading = false;
                          });
                        }
                      }
                      }),
                    

                    RaisedButton(
                      color: Colors.white,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.orange[800],fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {widget.toggleView();}
                      ),


                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
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
