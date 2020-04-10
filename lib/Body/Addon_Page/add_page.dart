import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Body/Addon_Page/cslider.dart';
import 'package:flutterapp/Body/Category_Page/newlist.dart';
import 'package:flutterapp/Body/product_list_tab.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CSlider(),
            SizedBox(width: 10, height: 10.0),
            SizedBox(
              child: Center(
                  child: Text(
                'Category',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 20,
                  ),
                ),
              )),
            ),
            Column(
              children: <Widget>[
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        child: Image.asset('packages/shrine_images/21-0.jpg'),
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ProductListTab(),
                            ),
                          );
                          // Navigator.of(context).pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: CupertinoButton(
                        child: Image.asset(
                          'packages/shrine_images/0-0.jpg',
                          // height: 80,
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
                    ),
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        child: Image.asset('packages/shrine_images/21-0.jpg'),
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ProductListTab(),
                            ),
                          );
                          // Navigator.of(context).pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: CupertinoButton(
                        child: Image.asset(
                          'packages/shrine_images/0-0.jpg',
                          // height: 80,
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
                    ),
                  ],
                )
              ],
            ),

          ],
        )),
      ),
    );
  }
}
