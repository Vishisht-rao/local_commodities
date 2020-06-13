import 'package:flutter/foundation.dart';

class ItemData {

  final String name;
  final String imageLoc;
  final String price;
  final String type;
  final int counter;
  final int qtyType;
  final double spPrice;

  ItemData({this.name,this.imageLoc,this.price,this.type,this.counter,this.qtyType,this.spPrice});


}

class AllItems {

  final String name;
  final String imageLoc;
  final double price;
  final int type;
  final int counter;
  final int qtyType;
  final double spPrice;

  AllItems({this.name,this.imageLoc,this.price,this.type,this.counter,this.qtyType,this.spPrice});


}



class Item {
  final String image;
  final String brand;
  final String name;
  final int price;

  Item({
    @required this.image,
    @required this.brand,
    @required this.name,
    @required this.price,
    });
}
