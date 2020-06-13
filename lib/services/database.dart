import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_commodities/models/item.dart';
import 'package:local_commodities/models/user.dart';
import 'package:local_commodities/models/store.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference users = Firestore.instance.collection('users');
  //final CollectionReference stores = Firestore.instance.collection('stores');
  final CollectionReference stores = Firestore.instance.collection('Stores');
   

  String getName() {
    if (uid=='8a7zoAUV4Ncj7JHLmbGQqZnbqua2') return 'Store7';
    else if (uid=='Ffkds1paC0YgdlgymjKNF1pFTG92') return 'Store5';
    else if (uid=='Ld7Bocl6Q8VO3FyONwH7010ewHA2') return 'Store4';
    else if (uid=='ThMRoqUyCjh8qRomEzfhCIyDbWf1') return 'Store1';
    else if (uid=='h871KZrsCPeFrfrRAGi6aDcWZuh1') return 'Store2';
    else if (uid=='qC3J4J1knsVjzjwouQ5c8YqhpXw1') return 'Store3';
    else if (uid=='sGwRR2DhTVczhE5z1NUGpYep0x42') return 'Store6';
    else return 'Store8';
  }

  Future addUserTypeandName(String userType, String name) async {
    return await users.document(uid).setData({
      'Type' : userType,
      'Name' : name,
    });
  }

  Future addStoreInfo(String name,String address,String imageLoc) async {
    return await stores.document(getName()).setData({
      'Name': name,
      'Address': address,
      'Image': imageLoc,
    });
  }

  Future addItemData(String name, String price, String type) async {
    return await stores.document(getName()).collection('Items').document(name).setData({  
    'Name': name,
    'Image': name + '.jpg',
    'Price': price,
    'Type': type,
    'counter': 0,
    'qty_type': 3,
    'sp_price': 0,
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
    return stores.document(getName()).snapshots()
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


