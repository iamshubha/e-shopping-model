import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Service/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/app_state_model.dart';
import '../model/product.dart';
import 'styles.dart';

// const double _kDateTimePickerHeight = 216;

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  String name;
  String email;
  String location;
  String pincode;
  // DateTime dateTime = DateTime.now();
  final _currencyFormat = NumberFormat.currency(symbol: '\Rs.');

  Widget _buildNameField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Name',
      onChanged: (newName) {
        setState(() {
          name = newName;
        });
      },
    );
  }

  Widget _buildEmailField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      // textCapitalization: TextCapitalization.words,
      autocorrect: false,

      keyboardType: TextInputType.emailAddress,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Email',
      onChanged: (newEmail) {
        setState(() {
          email = newEmail;
        });
      },
    );
  }

  Widget _buildPincodeField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      // textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,

      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Name',
      onChanged: (newPincode) {
        setState(() {
          pincode = newPincode;
        });
      },
    );
  }

  // Widget _buildEmailField() {
  //   return const CupertinoTextField(
  //       prefix: Icon(
  //       CupertinoIcons.mail_solid,
  //       color: CupertinoColors.lightBackgroundGray,
  //       size: 28,
  //     ),
  //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
  //     clearButtonMode: OverlayVisibilityMode.editing,
  //     keyboardType: TextInputType.emailAddress,
  //     autocorrect: false,
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           width: 0,
  //           color: CupertinoColors.inactiveGray,
  //         ),
  //       ),
  //     ),
  //     placeholder: 'Email',
  //     onChanged: (newEmail) {
  //       setState(() {
  //         email = newEmail;
  //       });
  //     },
  //   );
  // }

  Widget _buildLocationField() {
    return const CupertinoTextField(
      prefix: Icon(
        CupertinoIcons.location_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Location',
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(
      AppStateModel model) {
    return SliverChildBuilderDelegate(
      (context, index) {
        final productIndex = index - 4;
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildNameField(),
            );
          case 1:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildEmailField(),
            );
          case 2:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildLocationField(),
            );
            case 3:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPincodeField(),
            );
          case 4:
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              // padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: CupertinoButton(
                  child: Text('tap here'),
                  onPressed: () {
                    print(name.toString());
                    print(email.toString());
                    print(model.totalCost.toString());
                    print(
                        model.productsInCart.toString()); //TODO: product detail
                    // _signOut(context);
                  }),
            );
          default:
            if (model.productsInCart.length > productIndex) {
              return ShoppingCartItem(
                index: index,
                product: model.getProductById(
                    model.productsInCart.keys.toList()[productIndex]),
                quantity: model.productsInCart.values.toList()[productIndex],
                lastItem: productIndex == model.productsInCart.length - 1,
                formatter: _currencyFormat,
              );
            } else if (model.productsInCart.keys.length == productIndex &&
                model.productsInCart.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Shipping '
                              '${_currencyFormat.format(model.shippingCost)}',
                              style: Styles.productRowItemPrice,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Tax ${_currencyFormat.format(model.tax)}',
                              style: Styles.productRowItemPrice,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Total  ${_currencyFormat.format(model.totalCost)}',
                              style: Styles.productRowTotal,
                            ),
                          ],
                        )
                      ],
                    ),
                    CupertinoButton(
                        child: Text('tap here'),
                        onPressed: () {
                          print(model.productsInCart
                              .toString()); //TODO: product detail
                          print(name.toString());
                          print(email.toString());
                          print(model.totalCost.toString());
                          // _signOut(context);
                        }),
                  ],
                ),
              );
            }
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 4),
              sliver: SliverList(
                delegate: _buildSliverChildBuilderDelegate(model),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    @required this.index,
    @required this.product,
    @required this.lastItem,
    @required this.quantity,
    @required this.formatter,
  });

  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    final model =
                        Provider.of<AppStateModel>(context, listen: false);
                    model.addProductToCart(product.id);
                  },
                  child: const Icon(
                    CupertinoIcons.plus_circled,
                    semanticLabel: 'Add',
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    final model =
                        Provider.of<AppStateModel>(context, listen: false);
                    model.removeItemFromCart(product.id);
                  },
                  child: const Icon(
                    CupertinoIcons.minus_circled,
                    semanticLabel: 'Delete',
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: Styles.productRowItemName,
                        ),
                        Text(
                          '${formatter.format(quantity * product.price)}',
                          style: Styles.productRowItemName,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${quantity > 1 ? '$quantity x ' : ''}'
                      '${formatter.format(product.price)}',
                      style: Styles.productRowItemPrice,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return row;
  }
}
