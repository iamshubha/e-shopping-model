import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/Service/models/job.dart';
import 'package:flutterapp/Service/services/api_path.dart';
// import 'package:grocerry/Service/models/job.dart';
// import 'package:grocerry/Service/services/api_path.dart';
// import 'package:grocerry/Service/services/firestore_service.dart';
import 'package:meta/meta.dart';

import 'firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> readeJobs();

  Future<void> createMesssage(Map<String, dynamic> jobData);
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({
    @required this.uid,
  }) : assert(uid != null);
  final String uid;

  final _servise = FirestoreService.instance;

  Future<void> createJob(Job job) async => await _servise.setData(
        path: APIPath.job(uid, documentIdFromCurrentDate()),
        data: job.toMap(),
      );

  Stream<List<Job>> readeJobs() => _servise.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );

  Future<void> createMesssage(Map<String, dynamic> jobData) async {
    final path = APIPath.job(uid, 'job_abc');
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(jobData);
  }
}
