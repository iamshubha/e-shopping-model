import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Body/model/app_state_model.dart';
import 'package:flutterapp/Body/model/product.dart';
import 'package:flutterapp/Service/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'styles.dart';

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;
  // AppStateModel _mdldescription;
  // Todo _todo;

  // static String totalCost = _mdldescription.totalCost.toString();

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
  String phonenumber;
  String pincode;
  // DateTime dateTime = DateTime.now();
  final _currencyFormat = NumberFormat.currency(symbol: '\Rs.');

  //
  // bool submitEnable = name.isNotEmpty;
  //
  Widget _buildNameField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person,
        color: CupertinoColors.darkBackgroundGray,
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
      placeholder: 'Full Name',
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
        CupertinoIcons.mail,
        color: CupertinoColors.darkBackgroundGray,
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

  Widget _buildPhoneNumberField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.phone,
        color: CupertinoColors.darkBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      // textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,
      maxLength: 10,
      maxLines: 1,
      maxLengthEnforced: true,

      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Phone Number',
      onChanged: (newphonenumber) {
        setState(() {
          phonenumber = newphonenumber;
        });
      },
    );
  }

  // String ct = AppStateModel().totalCost.toString();

  var _PincodeList = ['741404', '741402', '741401'];

  Widget _buildPinCodeField() {
    return CupertinoTextField(
      prefix: const Icon(
        Icons.person_pin_circle,
        // color: CupertinoColors.lightBackgroundGray,
        color: Colors.black38,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      // textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.number,
      maxLength: 6,

      maxLines: 1,
      maxLengthEnforced: true,

      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Pin Code',
      onChanged: (newPinCode) {
        setState(() {
          pincode = newPinCode;
        });
      },
    );
  }

  Widget _buildLocationField() {
    return const CupertinoTextField(
      prefix: Icon(
        CupertinoIcons.location,
        color: CupertinoColors.darkBackgroundGray,
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
        final productIndex = index - 5;
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildNameField(),
            );
          case 2:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildEmailField(),
            );
          case 4:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildLocationField(),
            );
          case 1:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPhoneNumberField(),
            );
          case 3:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildPinCodeField(),
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
                              '${(_currencyFormat.format(model.shippingCost))}'
                              // '${(_currencyFormat.format(model.spngCost))}'
                              '-'
                              '${model.subtotalCost > 400 ? 0 : 60}', //TODO: Shipping is here
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
                        child: Text('Proceed to checkout'),
                        onPressed: () {
                          print(model.productsInCart
                              .toString()); //TODO: product detail
                          print(name.toString());
                          print(email.toString());
                          print(model.totalCost.toString());
                          // print(totcst);
                          // print(model.totalCost);
                          // opencheckout();
                          // model.clearCart();
                          // openCheckout();
                          // print(_mdldescription.totalCost.toInt());
                          // openCheckout();
                          // opn();
                          openCheckout(model);
                        }
                        // onPressed: openCheckout,
                        ),
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

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(AppStateModel model) async {
    // final Todo todo = ;// = ModalRoute.of(context).settings.arguments;

    var options = {
      'key': 'rzp_test_tztX4UNia1WvJP',
      'amount': model.totalCost * 100,
      'name': name, //'Acme Corp.',
      'description': model.productsInCart.toString(), //'Fine T-Shirt',
      'prefill': {
        'contact': phonenumber,
        'email': email
      }, //'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
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
                // product.assetName,
                // package: product.assetPackage,
                product.image,
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
