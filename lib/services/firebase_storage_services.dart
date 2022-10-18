import 'package:get/get.dart';

import '../controllers/firebase_ref/references.dart';

class FirebaseStorageServices extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images") // Folder name
          .child("${imgName.toLowerCase()}.png"); // image name
      var imageUrl = await urlRef.getDownloadURL();
      return imageUrl;
    } catch (error) {
      print(error);
      return null;
      // rethrow;
    }
  }
}
