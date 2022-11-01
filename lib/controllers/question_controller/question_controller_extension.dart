import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';
import '../firebase_ref/references.dart';

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

  void tryAgain() {
    Get.find<QuestionPaperController>().navigateToQuestions(
      paper: questionPaperModel,
      tryAgain: true,
    );
  }

  Future<void> saveTestResult() async {
    // save all results to firebase
    var batch = firestore.batch();
    User? _user =
        Get.find<AuthController>().getUser(); // double check user is logged in.
    if (_user == null) {
      return;
    }
    batch.set(
      userRF
          .doc(_user.email)
          .collection("myrecent_test")
          .doc(questionPaperModel.id),
      {
        "points": points,
        "correct_answer": "$correctQuestionCount/${allquestions.length}",
        "question_id": questionPaperModel.id,
        "time": questionPaperModel.timeSeconds - remainSeconds,
      },
    );
    batch.commit();
    navigatetoHome();
  }
}
