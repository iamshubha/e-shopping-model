import 'package:cloud_firestore/cloud_firestore.dart';
class Prdts {
  static const NAME = "name";
  static const PRICE = "price";
  static const BRANDNAME = "brandname";
  static const IMAGE = "image";
  static const ID = "id";

  String _name;
  String _price;
  String _brandname;
  String _image;
  int _id;
  
  String get name => _name;
  String get price => _price;
  String get brandname => _brandname;
  String get image => _image;
  int get id => _id;

  Prdts.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _price = snapshot.data[PRICE];
    _brandname = snapshot.data[BRANDNAME];
    _image = snapshot.data[IMAGE];
    _id = snapshot.data[ID];
  }



}