import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutterapp/Service/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:grocerry/Service/services/auth.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: new AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: ExactAssetImage('assets/images/1.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Let\'s grow',
//                          style: TextStyle(
//                              fontSize: 40,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white),
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'With Mudi Bazaar',
//                          style: TextStyle(
//                              fontSize: 35,
//
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white),
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Online Grocerry Bazaar',
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Column(
                //TODO: button create here
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 60,
                      child: GoogleSignInButton(
                        borderRadius: 3,
                        onPressed: () => _signInWithGoogle(context),
                        darkMode: true,
                        textStyle: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    //
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 60,
                      child: FacebookSignInButton(
                        borderRadius: 3,
                        onPressed: () => _signInAnonymously(context),
                        // darkMode: true,
                        textStyle: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // body: Container(
      //   color: Colors.grey,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Center(
      //         child: GoogleSignInButton(
      //           borderRadius: 12.0,
      //           darkMode: true,
      //           onPressed: ()=> _signInWithGoogle(context),
      //         ),
      //       ),
      //       FlatButton(
      //         onPressed: ()=> _signInAnonymously(context),
      //         child: Text("sign in"),
      //         color: Colors.red,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
