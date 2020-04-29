import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Body/model/datamodel.dart';
import 'package:flutterapp/Body/model/panu.dart';
import 'package:provider/provider.dart';
import '../Service/services/auth.dart';

class Abcd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductModel productModelDatabase = ProductModel();
    return Container(
      child: StreamProvider(
        create: (BuildContext context) => productModelDatabase.getData(),
        //dataMoodel.get,
        child: CupertinoStoreApp(),
      ),
    );
  }
}

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CupertinoStoreHomePage(),
      home: TouchPage(),
    );
  }
}

class TouchPage extends StatefulWidget {
  @override
  _TouchPageState createState() => _TouchPageState();
}

class _TouchPageState extends State<TouchPage> {
  TabController tabController;
  int _currentPage = 0;
  final _pages = [HomeBody(), HomeBody(), HomeBody()];

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('bazzar'),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.exit_to_app),
              onPressed: () => _signOut(context),
            )
          ],
        ),
        // drawer: Drawer(),
        body: _pages[_currentPage],
        bottomNavigationBar: BtmNvBFancy(context),
      ),
    );
  }

  Widget BtmNvBFancy(BuildContext context) {
    return FancyBottomBar(
      type: FancyType.FancyV1,
      items: [
        FancyItem(
          textColor: Colors.grey,
          title: 'Category',
          icon: Icon(Icons.category),
        ),
        FancyItem(
          textColor: Colors.grey,
          title: 'Home',
          icon: Icon(Icons.home),
        ),
        FancyItem(
          textColor: Colors.grey,
          title: 'Home',
          icon: Icon(Icons.shopping_basket),
        ),
      ],
      onItemSelected: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List productDataList = Provider.of<List<DataMoodel>>(context);
    return Scaffold(
      body: productDataList == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: productDataList.length,
              itemBuilder: (_, int index) => Padding(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 30),
                          child: Image.network(
                            productDataList[index].image,
                            width: 130,
                            height: 90,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(productDataList[index].name),
                            Text(productDataList[index].bname),
                            Text(productDataList[index].price)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            // final model =
                            //     Provider.of<DataMoodel>(context, listen: false);
                            // model.addProductToCart(productDataList[index].pid);
                            print(productDataList[index].pid + '${productDataList[index].price}'+'${productDataList[index].name}');
                          },
                          child: Text('data'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
