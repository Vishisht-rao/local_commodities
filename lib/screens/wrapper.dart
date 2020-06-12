import 'package:flutter/material.dart';
import 'package:local_commodities/screens/authenticate/authenticate.dart';
import 'package:local_commodities/screens/home_customer/home_customer.dart';
import 'package:local_commodities/screens/home_delivery/home_delivery.dart';
import 'package:local_commodities/screens/home_owner/home_owner.dart';
import 'package:provider/provider.dart';
import 'package:local_commodities/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String userType;

class Wrapper extends StatelessWidget {

  final CollectionReference users = Firestore.instance.collection('users');
  //final String userType = '';

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

      users.getDocuments().then((querySnapshot){
        querySnapshot.documents.forEach((result){
          if (result.documentID == user.uid) {
            print(result.documentID);
            print(user.uid);
            print(result.data['Type']);
            userType = result.data['Type'];
          }
        });
     });
    

    print(userType);
    
    //returns either a home or authenticate widget
    if (userType==null) {
      return Authenticate();
    } else if (userType=='Customer') {
      return HomeCustomer();
    }
    else if (userType=='Store Owner') {
      return HomeOwner();
    }
    else {
      return HomeDelivery();
    }
    
  }
}

/*getUserType() async {
      return await users.document(user.uid).get();
    }

    getUserType().then((val){
      String userType = val.documents[user.uid].data['Type'];
    });*/

    /*Stream<DocumentSnapshot> provideDocumentFieldStream() {
    return Firestore.instance
        .collection('users')
        .document(user.uid)
        .snapshots();
}

    StreamBuilder<DocumentSnapshot>(
    stream: provideDocumentFieldStream(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
            //snapshot -> AsyncSnapshot of DocumentSnapshot
            //snapshot.data -> DocumentSnapshot
            //snapshot.data.data -> Map of fields that you need :)

            Map<String, dynamic> documentFields = snapshot.data.data;
            //TO DO Okay, now you can use documentFields (json) as needed

            return Text(documentFields['Type']);
        }
    }
);*/
    