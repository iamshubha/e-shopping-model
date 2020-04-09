import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Body/Category_Page/newlist.dart';
import 'package:flutterapp/Body/product_list_tab.dart';
import 'package:flutterapp/Body/styles.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
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
          CupertinoButton(
            child: Image.asset(
              'packages/shrine_images/0-0.jpg',
              height: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ProductAssListTab(),
                ),
              );
              // Navigator.of(context).pop(context);
            },
          ),

          // CupertinoButton(
          //     child: Column(
          //       children: <Widget>[
          //         ClipRRect(
          //           borderRadius: BorderRadius.circular(4),
          //           child: Image.asset(
          //             'packages/shrine_images/0-0.jpg',
          //             fit: BoxFit.cover,
          //             width: 76,
          //             height: 76,
          //           ),
          //         ),
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 12),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Text(
          //                   'Rice',
          //                   style: Styles.productRowItemName,
          //                 ),
                          
                          
          //               ],
          //             ),
          //           ),
          //         ),
                  
          //       ],
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         CupertinoPageRoute(
          //           builder: (context) => ProductAssListTab(),
          //         ),
          //       );
          //     })
        
        ],
      ),
    ));
  }
}
