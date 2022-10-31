import 'dart:async';

import 'package:appkwiz/controllers/firebase_ref/loading_status.dart';
import 'package:appkwiz/controllers/firebase_ref/references.dart';
import 'package:appkwiz/models/question_paper_model.dart';
import 'package:appkwiz/screens/question/result_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  final Rx<LoadingStatus> loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final List<Questions> allquestions = <Questions>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allquestions.length - 1;
  Rxn<Questions> currentQuestions = Rxn<Questions>();

  // Timer
  Timer? _timer;
  int remainSeconds = 1;
  final RxString time = "00:00".obs;

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    loadData(_questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;
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
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
    // done
    if (questionPaper.questions != null &&
        questionPaper.questions!.isNotEmpty) {
      allquestions.assignAll(
        questionPaper.questions!,
      ); // saving all qiestrions in this variable
      // print(questionPaper.questions![0]);
      currentQuestions.value = questionPaper.questions![0];
      startTimer(questionPaper.timeSeconds);
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestions.value!.selectedAnswer = answer;
    update(["answers_lists"]);
  }

  String get completedTest {
    final answered = allquestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return "$answered out of ${allquestions.length} answered";
  }

  void nextQuestion() {
    if (questionIndex.value >= allquestions.length - 1) {
      return;
    }
    questionIndex.value++;
    currentQuestions.value = allquestions[questionIndex.value];
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) {
      return;
    }
    questionIndex.value--;
    currentQuestions.value = allquestions[questionIndex.value];
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(
      duration,
      (Timer timer) {
        if (remainSeconds == 0) {
          timer.cancel();
        } else {
          int minutes = remainSeconds ~/ 60;
          int seconds = remainSeconds % 60;
          time.value =
              "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
          remainSeconds--;
        }
      },
    );
  }

  void jumpToQuestion(int index, {bool isGoBack = true}) {
    questionIndex.value = index;
    currentQuestions.value = allquestions[index];
    if (isGoBack) {
      Get.back();
    }
  }

  void complete() {
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }
}
