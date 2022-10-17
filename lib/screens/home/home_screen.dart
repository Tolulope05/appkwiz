import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController =
        Get.find<QuestionPaperController>();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: FadeInImage(
                  placeholder:
                      const AssetImage("assets/images/app_splash_logo.png"),
                  image: NetworkImage(
                    _questionPaperController.allPaperImages[index],
                  ),
                ),
              ),
            );
          },
          itemCount: _questionPaperController.allPaperImages.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
