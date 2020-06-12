import 'package:flutter/material.dart';
import 'package:local_commodities/screens/authenticate/authenticate.dart';
import 'package:local_commodities/screens/home_customer/home_customer.dart';
import 'package:local_commodities/screens/home_delivery/home_delivery.dart';
import 'package:local_commodities/screens/home_owner/home_owner.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    //returns either a home or authenticate widget
    if (user==null) {
      return Authenticate();
    } else {
      return HomeCustomer();
    }
  }
}