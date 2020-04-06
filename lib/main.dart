import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Service/app/landing_page.dart';
import 'package:provider/provider.dart';

import 'Service/services/auth.dart';
import 'app.dart';
import 'model/app_state_model.dart';

// void main() {
//   // This app is designed only to work vertically, so we limit
//   // orientations to portrait up and down.
//   // SystemChrome.setPreferredOrientations(
//   //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

//   return runApp(
//     ChangeNotifierProvider<AppStateModel>(
//       create: (context) => AppStateModel()..loadProducts(),
//       child: CupertinoStoreApp(),
//     ),
//   );
// }
void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyPage(),
      ),
    );

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: LandingPage(),

//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'School',
//        theme: ThemeData(primarySwatch: Colors.indigo),
//        home: LandingPage(),
//      ),
    );
  }
}
