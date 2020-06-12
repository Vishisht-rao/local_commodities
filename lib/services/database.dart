import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_commodities/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference users = Firestore.instance.collection('users');

  Future addUserTypeandName(String userType, String name) async {
    return await users.document(uid).setData({
      'Type' : userType,
      'Name' : name,
    });
  }
}