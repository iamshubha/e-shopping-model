import 'package:flutter/cupertino.dart';
import 'package:flutterapp/try_to_get_product_from_firebase/prdts.dart';
import 'package:flutterapp/try_to_get_product_from_firebase/prdtsrvc.dart';

class PrdtProvider with ChangeNotifier {
  List<Prdts> prdtlst =[];
  Prdtsrvcs _productServices = Prdtsrvcs();

  PrdtProvider(){
    loadProducts();
  }
  Future loadProducts()async{
    prdtlst = await _productServices.getPrdts();
    notifyListeners();
  }
  
}