import 'package:flutter/foundation.dart' as foundation;

class DataMoodel extends foundation.ChangeNotifier{
  String bname;
  String image;
  String name;
  String price;
  String pid;

  DataMoodel({this.bname, this.image, this.name, this.price,this.pid});

  DataMoodel.fromJson(Map<String, dynamic> parsedJSON)
      : bname = parsedJSON['bname'],
        name = parsedJSON['name'],
        price = parsedJSON['price'],
        pid = parsedJSON['pid'],
        image = parsedJSON['image'];


  // Adds a product to the cart.
  final _productsInCart = <int, int>{};
  void addProductToCart(int pid) {
    if (!_productsInCart.containsKey(pid)) {
      _productsInCart[pid] = 1;
    } else {
      _productsInCart[pid]++;
    }

    notifyListeners();
  }
}
