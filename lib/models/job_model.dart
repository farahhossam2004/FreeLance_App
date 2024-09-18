class JobModel {
  final String title;
  final String description;
  final String budget;
  final String date;
  final List<String> tags;
  final String location;
  final String duration;
  final int noOfPropsals;
  final bool isVerified;
  final String jobType;

  JobModel(
      {required this.title,
      required this.description,
      required this.budget,
      required this.date,
      required this.tags,
      required this.location,
      required this.duration,
      required this.noOfPropsals,
      required this.isVerified,
      required this.jobType});
}
