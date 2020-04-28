
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/Body/model/datamodel.dart';

class ProductModel {
  Firestore _firestoreDataBase = Firestore.instance;

 
    Stream<List<DataMoodel>> getData() {
      return _firestoreDataBase.collection('Products').snapshots().map(
          (snapShot) => snapShot.documents
              .map((document) => DataMoodel.fromJson(document.data))
              .toList());
    }
  
}