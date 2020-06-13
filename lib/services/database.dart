import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_commodities/models/user.dart';
import 'package:local_commodities/models/store.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference users = Firestore.instance.collection('users');
  final CollectionReference stores = Firestore.instance.collection('stores');

  Future addUserTypeandName(String userType, String name) async {
    return await users.document(uid).setData({
      'Type' : userType,
      'Name' : name,
    });
  }

  Future addStoreInfo(String name,String address,String imageLoc) async {
    return await stores.document(uid).setData({
      'Name': name,
      'Address': address,
      'Image': imageLoc,
    });
  }

  //stores list from snapshot
  List<Store> _storesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Store(
        name: doc.data['Name'] ?? '',
        address: doc.data['Address'] ?? '',
        imageLoc: doc.data['Image'] ?? '',
      );
    }).toList();
  }

  Store _storeFromSnapshot(DocumentSnapshot snapshot) {
    return Store(
      name: snapshot.data['Name'],
      address: snapshot.data['Address'],
      imageLoc: snapshot.data['Image'],
    );
  }

  Stream<List<Store>> get shops {
    return stores.snapshots()
      .map(_storesListFromSnapshot);
  }

  Stream<Store> get store {
    return stores.document(uid).snapshots()
    .map(_storeFromSnapshot);
  }

  UserType _userTypeFromSnapshot(DocumentSnapshot snapshot) {
    return UserType(userType: snapshot.data['Type']);
  }

  Stream<UserType> get userType {
    return users.document(uid).snapshots()
    .map(_userTypeFromSnapshot);
  }

} 


