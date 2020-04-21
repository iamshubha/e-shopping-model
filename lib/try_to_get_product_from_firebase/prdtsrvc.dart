import 'package:cloud_firestore/cloud_firestore.dart';
import 'prdts.dart';


class Prdtsrvcs {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<Prdts>> getPrdts()async =>
    _firestore.collection(collection).getDocuments().then((result) {
      List<Prdts> prdtlst = [];
      print("${result.documents}");
      for(DocumentSnapshot item in result.documents){
        prdtlst.add(Prdts.fromSnapshot(item));
        print("${prdtlst.length}");
      }
      return prdtlst;
    });
  
}