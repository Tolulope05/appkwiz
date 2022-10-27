import 'package:appkwiz/controllers/firebase_ref/references.dart';
import 'package:appkwiz/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final List<Questions> allquestions = <Questions>[];
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    loadData(_questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaperModel.id)
              .collection("questions")
              .get();
      final List<Questions> questions = questionQuery.docs
          .map(
            (snapShot) => Questions.fromQuerySnapshots(snapShot),
          )
          .toList();

      questionPaper.questions = questions;
      for (Questions _questions in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_questions.id)
                .collection("answers")
                .get();

        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        _questions.answers = answers;

        // done
        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allquestions.assignAll(
            questionPaper.questions!,
          ); // saving all qiestrions in this variable

        }
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }
}
