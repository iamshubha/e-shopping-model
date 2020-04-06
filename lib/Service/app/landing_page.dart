import 'package:flutter/material.dart';
import 'package:flutterapp/Body/app.dart';
import 'package:flutterapp/Service/app/sing_in_page.dart';
import 'package:flutterapp/Service/services/auth.dart';
import 'package:flutterapp/Service/services/databbase.dart';
// import 'package:grocerry/Service/app/sing_in_page.dart';
// import 'package:grocerry/Service/services/auth.dart';
// import 'package:grocerry/Service/services/databbase.dart';
import 'package:provider/provider.dart';

// import '../../Body/mainbody.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return Comn(child: SignInPage());
          }
          return Provider<Database>(
            create: (_) => FirestoreDatabase(uid: user.uid),
            // child: Comn(child: HomePage()),
            child: Comn(child: Abcd()),
          );
        } else {
          return Comn(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

class TouchPage {
}

class Comn extends StatelessWidget {

  const Comn({Key key, @required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: child,
    );
  }
}
