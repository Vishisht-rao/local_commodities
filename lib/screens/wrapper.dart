import 'package:flutter/material.dart';
import 'package:local_commodities/screens/authenticate/authenticate.dart';
import 'package:local_commodities/screens/home_customer/home_customer.dart';
import 'package:local_commodities/screens/home_owner/home_owner.dart';
import 'package:local_commodities/services/database.dart';
import 'package:local_commodities/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/user.dart';




class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    if (user != null) {

    return StreamBuilder<UserType>(
      stream: DatabaseService(uid: user.uid).userType,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          UserType userType = snapshot.data;
          if(userType.userType == 'Customer'){
          return HomeCustomer();}
          else if (userType.userType == 'Store Owner') {
            return HomeOwner();}
  
        }
        
        else {
          return Loading();
        }
      }
      
    );}
    else {
      return Authenticate();
    }
  }
}
  