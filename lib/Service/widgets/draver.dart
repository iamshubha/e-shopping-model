import 'package:flutter/material.dart';
import 'daily_notice.dart';
// import 'package:schoolapp/widgets/daily_notice.dart';

class Drw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new ListTile(
              title: new Text("Daily Notices "),
              trailing: Icon(Icons.notification_important),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dnotice()),
                );
              }),
          Divider(),
        ],
      ),
    );
  }
}
