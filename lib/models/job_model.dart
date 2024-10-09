import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String title;
  final String description;
  final String budget;
  // final String date;
  final List<String?> tags;
  final String location;
  final String duration;
  final int? noOfPropsals;
  final String jobType;
  final String clientName;
  var time;

  JobModel(
      {required this.title,
      required this.description,
      required this.budget,
      required this.tags,
      required this.location,
      required this.duration,
      this.noOfPropsals = 0,
      required this.jobType,
      required this.clientName,
      required this.time});
}
