

// ignore_for_file: prefer_typing_uninitialized_variables

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
  final String clientEmail;
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
      required this.time,
      required this.clientEmail});
}
