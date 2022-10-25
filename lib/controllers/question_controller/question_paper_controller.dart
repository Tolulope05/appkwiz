import 'package:appkwiz/controllers/auth_controller.dart';
import 'package:appkwiz/models/question_paper_model.dart';
import 'package:appkwiz/services/firebase_storage_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class QuestionPaperController extends GetxController {
  // final RxList<String> allPaperImages = <String>[].obs;
  final RxList<QuestionPaperModel> allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      print(data.docs[0].data());
      List<QuestionPaperModel> paperList =
          data.docs.map((e) => QuestionPaperModel.fromSnapshot(e)).toList();
      allPapers.assignAll(paperList); // Important
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageServices>().getImage(paper.title);
        paper.imageUrl = imgUrl;
        allPapers.assignAll(paperList);
      }
    } catch (error) {
      print(error);
      // rethrow;
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed(page);
      } else {
        print("Logged in");
        // Get.toNamed(page);
      }
    } else {
      print("The title is ${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }
}
