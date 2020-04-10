// import 'package:flutter/material.dart';
// import 'package:flutterapp/Service/models/job.dart';
// import 'package:flutterapp/Service/services/databbase.dart';
// // import 'package:grocerry/Service/models/job.dart';
// // import 'package:grocerry/Service/services/databbase.dart';
// import 'package:provider/provider.dart';

// class AddjobPage extends StatefulWidget {
//   const AddjobPage({Key key, @required this.database}) : super(key: key);

//   final Database database;

//   static Future<void> show(BuildContext context) async {
//     final database = Provider.of<Database>(context, listen: false);
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => AddjobPage(
//           database: database,
//         ),
//         fullscreenDialog: true,
//       ),
//     );
//   }

//   @override
//   _AddjobPageState createState() => _AddjobPageState();
// }

// class _AddjobPageState extends State<AddjobPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _name;
//   int _ratePerHour;

//   bool _validAndSaveForm() {
//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }

//   Future<void> _submit() async {
//     //TODO: Validate form & Save
//     if (_validAndSaveForm()) {
//       final job = Job(name: _name, ratePerHour: _ratePerHour);
//       await widget.database.createJob(job);
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2.0,
//         title: Text('New Job'),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: _submit,
//             child: Text(
//               'save',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           )
//         ],
//       ),
//       body: _buildContents(),
//       backgroundColor: Colors.grey[400],
//     );
//   }

//   Widget _buildContents() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: _buildForm(),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//         key: _formKey,
//         child: Column(
//           children: _buildFormChildern(),
//         ));
//   }

//   List<Widget> _buildFormChildern() {
//     return [
//       TextFormField(
//         decoration: InputDecoration(labelText: 'Job Name'),
//         onSaved: (value) => _name = value,
//         validator: (value) =>
//             value.isNotEmpty ? null : 'name is not able to save empty',
//       ),
//       TextFormField(
//         decoration: InputDecoration(labelText: 'rate per hour'),
//         onSaved: (value) => _ratePerHour = int.parse(value) ?? 0,
//         keyboardType: TextInputType.numberWithOptions(
//           decimal: false,
//           signed: false,
//         ),
//       )
//     ];
//   }
// }
