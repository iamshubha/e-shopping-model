import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Body/product_list_tab.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: AddHomePage(),
    );
  }
}

class AddHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ProductListTab(),
    return CupertinoPageScaffold(
        child: Center(
      child: CupertinoButton(
        child: Text('press here'),
        onPressed: () {
          
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => ProductListTab(),
            ),
          );
          // Navigator.of(context).pop(context);
        },
      ),
    ));
  }
}
