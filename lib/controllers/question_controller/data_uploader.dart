import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:appkwiz/controllers/firebase_ref/loading_status.dart';
import 'package:appkwiz/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; // loading status observable
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // 0
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // load json file and print path
    final List papersInAssets = manifestMap.keys
        .where(
          (path) =>
              path.startsWith("assets/DB/paper") && path.contains(".json"),
        )
        .toList();
    List<QuestionPaperModel> questionPaper = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPaper
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print(stringPaperContent);
    }
    // print("Items number ${questionPaper[0].id}");
    var batch = firestore.batch();
    for (var paper in questionPaper) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var questions in paper.questions!) {
        final questionPath = questionRF(
          paperID: paper.id,
          questionID: questions.id,
        );
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });
        for (var answers in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answers.identifier),
              {"identifier": answers.identifier, "answer": answers.answer});
        }
      }
    }
    await batch.commit(); // To submit everything in our firebase database
    loadingStatus.value = LoadingStatus.completed; // 1
  }

  uploadImages() {
    FirebaseStorage _storage = FirebaseStorage.instance;
    // _storage.ref("question_paper_images").putFile()
  }

  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');

  //   // final file = File('${(await getTemporaryDirectory()).path}/$path'); //import 'package:path_provider/path_provider.dart';
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  //   return file;
  // } // for future purpose
}
