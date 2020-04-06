import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutterapp/Service/services/auth.dart';
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
      final auth = Provider.of<AuthBase>(context , listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: GoogleSignInButton(
                borderRadius: 12.0,
                darkMode: true,
                onPressed: ()=> _signInWithGoogle(context),
              ),
            ),
            FlatButton(
              onPressed: ()=> _signInAnonymously(context),
              child: Text("sign in"),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
