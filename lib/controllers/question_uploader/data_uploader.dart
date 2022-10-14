import 'dart:convert';

import 'package:appkwiz/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  void uploadData() async {
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
    }
    await batch.commit(); // To submit everything in our firebase database
  }
}
