import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String? jobId;
  String? title;
  String? location;
  String? idr;
  String? time;
  String? companyName;
  String? companyLogo;
  List<dynamic>? content;
  List<dynamic>? jobDesc;
  List<dynamic>? criteria;

  JobModel({
    this.jobId,
    this.title,
    this.location,
    this.idr,
    this.time,
    this.companyName,
    this.companyLogo,
    this.content,
    this.jobDesc,
    this.criteria,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    jobId = json['id'];
    title = json['title'];
    location = json['location'];
    idr = json['idr'];
    time = json['time'];
    companyName = json['companyName'];
    companyLogo = json['companyLogo'];
    content = json['content'];
    jobDesc = json['content'][0]['Job Description'];
    criteria = json['content'][0]['Criteria'];
  }

  JobModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    jobId = snapshot.id;
    title = snapshot["title"];
    location = snapshot["location"];
    idr = snapshot["idr"];
    time = snapshot["time"];
    companyName = snapshot["companyName"];
    companyLogo = snapshot["companyLogo"];
    jobDesc = snapshot["Job Description"];
    criteria = snapshot["criteria"];
  }
}

// Map<String, dynamic>.from(json).containsKey('Job Description') ?
