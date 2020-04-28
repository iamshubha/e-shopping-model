
class DataMoodel {
  String bname;
  String image;
  String name;
  String price;

  DataMoodel({this.bname, this.image, this.name, this.price});

  DataMoodel.fromJson(Map<String, dynamic> parsedJSON)
      : bname = parsedJSON['bname'],
        name = parsedJSON['name'],
        price = parsedJSON['price'],
        image = parsedJSON['image'];
}
