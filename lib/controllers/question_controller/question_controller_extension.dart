import 'package:appkwiz/controllers/question_controller/questions_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  /// do something on this class with Questioncontroller properties accessible
  int get correctQuestionCount => allquestions
      .where((ques) => ques.selectedAnswer == ques.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return "$correctQuestionCount out of ${allquestions.length} are correct";
  }

  String get points {
    // This is totally dependent on you on hw you want to count your points
    var points = (correctQuestionCount / allquestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }
}
