/*import 'package:local_commodities/models/item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_commodities/services/database.dart';


class MoveEverything extends StatefulWidget {
  @override
  _MoveEverythingState createState() => _MoveEverythingState();
}

class _MoveEverythingState extends State<MoveEverything> {

  String name;
  String imageLoc;
  double price;
  int type;
  int counter;
  int qtyType;
  double spPrice;
  List<String> uids = [
    '8a7zoAUV4Ncj7JHLmbGQqZnbqua2',
    'Ffkds1paC0YgdlgymjKNF1pFTG92',
    'Ld7Bocl6Q8VO3FyONwH7010ewHA2',
    'ThMRoqUyCjh8qRomEzfhCIyDbWf1',
    'h871KZrsCPeFrfrRAGi6aDcWZuh1',
    'qC3J4J1knsVjzjwouQ5c8YqhpXw1',
    'sGwRR2DhTVczhE5z1NUGpYep0x42',
    'x8CWi0qVhrc7qKscbZX7eZkeBib2'
    ];

  @override
  Widget build(BuildContext context) {

    final allItems = Provider.of<List<AllItems>>(context) ?? [];

    return StreamProvider<List<AllItems>>.value(
        value: DatabaseService().allItems,
        
        for(int i = 0; i<8; i++) {

        }

      
        
    );
    
  
  }
}

/*final allItems = Provider.of<List<AllItems>>(context) ?? [];
    return ListView.builder(
      itemCount: allItems.length,
      itemBuilder: (context,index) {
      DatabaseService(uid: uids[index]).addAllItems(name, price, type, imageLoc, counter, qtyType, spPrice);*/*/