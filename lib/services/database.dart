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

  UserType _userTypeFromSnapshot(DocumentSnapshot snapshot) {
    return UserType(userType: snapshot.data['Type']);
  }

  Stream<UserType> get userType {
    return users.document(uid).snapshots()
    .map(_userTypeFromSnapshot);
  }

} 


/*
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
    */