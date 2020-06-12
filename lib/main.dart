import 'package:flutter/material.dart';
import 'package:local_commodities/models/user.dart';
import 'package:local_commodities/services/auth.dart';
import 'package:local_commodities/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.materialRoutes,
          home: Wrapper(),  
      ),
    );
  }
}

