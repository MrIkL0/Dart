import 'package:flutter/foundation.dart';

class ResultAnswer {
  final String questionNumber;
  final String answerOption;

  ResultAnswer({
    required this.questionNumber,
    required this.answerOption,
  });
}

class ResultAnswersData {
  final List<ResultAnswer> data = [];
}