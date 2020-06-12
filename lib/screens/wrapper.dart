import 'package:flutter/material.dart';
import 'package:local_commodities/screens/authenticate/authenticate.dart';
import 'package:local_commodities/screens/home_customer/home_customer.dart';
import 'package:local_commodities/screens/home_delivery/home_delivery.dart';
import 'package:local_commodities/screens/home_owner/home_owner.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //returns either a home or authenticate widget
    return Authenticate();
  }
}