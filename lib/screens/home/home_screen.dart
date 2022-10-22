import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/cusstom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
import 'package:appkwiz/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController =
        Get.find<QuestionPaperController>();
    return Scaffold(
      body: Container(
        // color: Colors.blueAccent,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobilescreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      AppIcons.menuLeft,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          AppIcons.peace,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Hello Friend",
                            style: detailsTextStyle.copyWith(
                              color: onSurfaceTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "What do you want to learn toay?",
                      style: headerTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ContentArea(
                    child: Obx(
                      () => ListView.separated(
                        padding: UIParamters.mobileScreenPadding,
                        itemBuilder: (BuildContext context, int index) {
                          return QuestionCard(
                            model: _questionPaperController.allPapers[index],
                          );
                        },
                        itemCount: _questionPaperController.allPapers.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
