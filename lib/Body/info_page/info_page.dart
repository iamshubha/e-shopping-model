import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Body/model/datamodel.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List dataList = Provider.of<List<DataMoodel>>(context);
    return CupertinoPageScaffold(
        child: ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (_, int index) => SafeArea(
              child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    dataList[index].image,
                    fit: BoxFit.cover,
                    height: 96,
                    width: 96,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(dataList[index].bname,style: Styles.productRowItemName,),
                        Text(dataList[index].name,style: Styles.productRowItemName,),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Rs.${dataList[index].price}',style: Styles.productRowItemName,),
                        ),
                        FlatButton(onPressed: (){print(dataList[index].price);}, child: Text('press here'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

