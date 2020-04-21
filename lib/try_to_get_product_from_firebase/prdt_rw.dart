import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Body/model/app_state_model.dart';
import 'package:flutterapp/Body/styles.dart';
import 'package:flutterapp/try_to_get_product_from_firebase/prdt_provider.dart';
import 'package:provider/provider.dart';


class ProductRowItem extends StatelessWidget {
  
  const ProductRowItem({
    this.index,
    // this.product,
    this.lastItem,
  });

  // final Product product;
  final int index;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final prodts = Provider.of<PrdtProvider>(context);
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
                //product.assetName,//TODO change image from here
                //package: product.assetPackage,
                "${prodts.prdtlst[index].image}",
                fit: BoxFit.cover,
                width: 76,
                height: 76,
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${prodts.prdtlst[index].brandname.toString()}',
                    style: Styles.productRowItemName,
                  ),
                  Text(
                    '${prodts.prdtlst[index].name.toString()}',
                    style: Styles.productRowItemName,
                  ),
                  // DropdownButton(items: null, onChanged: null),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\Rs.\ ${prodts.prdtlst[index].price.toString()}',//.price}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final model = Provider.of<AppStateModel>(context, listen: false);
              model.addProductToCart(prodts.prdtlst[index].id);
            },
            child: const Icon(
              CupertinoIcons.plus_circled,
              semanticLabel: 'Add',
            ),
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
