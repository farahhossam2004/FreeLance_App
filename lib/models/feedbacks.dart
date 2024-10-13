class Feedbacks {
  String? comment;
  int starRate;

  Feedbacks({required this.starRate, this.comment});

  int get getfeedbackstars => starRate;
  String get getfeedbackcomment => comment!;

  toMap() {}
}
