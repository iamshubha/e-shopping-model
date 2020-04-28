import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Body/Addon_Page/add_page.dart';
import 'package:flutterapp/Body/info_page/info_page.dart';
import 'package:flutterapp/Body/model/app_state_model.dart';
import 'package:flutterapp/Body/model/datamodel.dart';
import 'package:flutterapp/Body/model/panu.dart';
import 'package:provider/provider.dart';
import 'info_page/info_page.dart';
import 'model/app_state_model.dart';
import 'search_tab.dart';
import 'shopping_cart_tab.dart';

class Abcd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final ProductModel productModelDatabase = ProductModel(); 
    return Container(
      child: StreamProvider(
        create: (BuildContext context) => productModelDatabase.getData(),//dataMoodel.get,
        child: CupertinoStoreApp(),
      ),
    );
  }
}

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateModel appStateModel = AppStateModel();
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(CupertinoIcons.location),
          //   title: Text('location'),
          // ),
        ],
        currentIndex: 1, //TODO: specifi the starting page
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: InfoPage(), //InfoPage(), // ProductListTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AddHomePage(), // ProductListTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShoppingCartTab(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
