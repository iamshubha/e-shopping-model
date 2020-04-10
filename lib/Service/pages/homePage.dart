// //import 'package:firebase_auth/firebase_auth.dart';
// //import 'dart:js';
// //import 'ser';

// //import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutterapp/Service/jobs/job_page.dart';
// import 'package:flutterapp/Service/services/auth.dart';
// import 'package:flutterapp/Service/services/databbase.dart';
// // import 'package:grocerry/Service/jobs/job_page.dart';
// // import 'package:grocerry/Service/services/auth.dart';
// // import 'package:grocerry/Service/services/databbase.dart';
// // import 'package:grocerry/Service/widgets/draver.dart';
// import 'package:provider/provider.dart';
// class HomePage extends StatelessWidget {
// //  HomePage({@required this.auth});
// //
// ////  final VoidCallback onSignOut;
// //  final AuthBase auth;

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       final auth = Provider.of<AuthBase>(context, listen: false);
//       await auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

// //  Future<void> _createJob(BuildContext context) async {
// //    final database = Provider.of<Database>(context, listen: false);
// //    await database.createJob(Job(name: 'hola', ratePerHour: 56));
// //  }

//   @override
//   Widget build(BuildContext context) {
//     final database = Provider.of<Database>(context);
//     database.readeJobs();
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Home page "),
//         actions: <Widget>[
//           FlatButton(
//             child: Icon(Icons.exit_to_app),
//             onPressed: () => _signOut(context),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () =>  AddjobPage.show(context),           //createJob(context),
//         child: Icon(Icons.add),
//       ),
//       // drawer: Drw(),
//       body: //Center(child: Text("data"),)

//       //_buildContents(context),

//       new ListView(
//         children: <Widget>[
//           // CSlider(),
//           FlatButton(
//             padding: EdgeInsets.all(12.0),
//             child: Container(
//               child: Text(
//                 "Developed by Devenger's Group",
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//               padding: EdgeInsets.all(20),
//               margin: EdgeInsets.all(20),
//               alignment: Alignment.bottomCenter,
//               color: Colors.black26,
//             ),
//             onPressed: () {},
//           ),
// //          Scaffold(body: _buildContents(context),)
//         ],
// ),

//     );
//   }

// //  Widget _buildContents(BuildContext context) {
// //    final database = Provider.of<Database>(context);
// //    return StreamBuilder<List<Job>>(
// //      stream: database.readeJobs(),
// //      builder: (context, snapshot){
// //        if (snapshot.hasData){
// //          final jobs = snapshot.data;
// //          final children = jobs.map((job)=> Text(job.name)).toList();
// //          return ListView(children: children);
// //        }
// //        return Center(child: CircularProgressIndicator());
// //      },
// //    );
// //  }

// }
