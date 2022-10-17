import 'package:appkwiz/services/firebase_storage_services.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final RxList<String> allPaperImages = <String>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];

    try {
      for (var image in imgName) {
        final imgUrl =
            await Get.find<FirebaseStorageServices>().getImage(image);
        allPaperImages.add(imgUrl!);
      }
    } catch (error) {
      print(error);
      // rethrow;
    }
  }
}
