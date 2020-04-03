import 'package:flutter/cupertino.dart';
// import 'package:flutterapp/shopping_location_tab.dart';
import 'product_list_tab.dart';
import 'search_tab.dart';
import 'shopping_cart_tab.dart';

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
    return CupertinoTabScaffold(
      
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
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
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ProductListTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShoppingCartTab(),
              );
            });
            break;
            // case 3:
            // returnValue = CupertinoTabView(builder: (context) {
            //   return CupertinoPageScaffold(
            //     child: ShoppingCartTab1(),
            //   );
            // });
            // break;
        }
        return returnValue;
      },
    );
  }
}
