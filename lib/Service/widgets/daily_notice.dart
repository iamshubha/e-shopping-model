// import 'package:flutter/material.dart';
// import 'package:flutterapp/Service/models/job.dart';
// import 'package:flutterapp/Service/services/databbase.dart';
// import 'package:provider/provider.dart';
// // import 'package:schoolapp/models/job.dart';
// // import 'package:schoolapp/services/databbase.dart';

// class Dnotice extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final database = Provider.of<Database>(context);
//     database.readeJobs();

//     return Scaffold(
//       appBar: new AppBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//       body: _buildContents(context),

// //      body: Column(
// //        mainAxisAlignment: MainAxisAlignment.start,
// //        crossAxisAlignment: CrossAxisAlignment.stretch,
// //        children: <Widget>[
// //          Center(
// //            child: Text("Daily Notice"),
// //          ),
// //        ],
// //      ),
      
//     );
//   }

//   Widget _buildContents(BuildContext context) {
//     final database = Provider.of<Database>(context);
//     return StreamBuilder<List<Job>>(
//       stream: database.readeJobs(),
//       builder: (context, snapshot){
//         if (snapshot.hasData){
//           final jobs = snapshot.data;
//           final children = jobs.map((job)=> Text(job.name)).toList();
//           return ListView(children: children);
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
