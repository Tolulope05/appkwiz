import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:appkwiz/controllers/zoom_drawer_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
import 'package:appkwiz/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_icons.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController =
        Get.find<QuestionPaperController>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: GetBuilder<MyZoomDrawerController>(builder: (contxt) {
          return ZoomDrawer(
            controller: contxt.zoomDrawerController,
            borderRadius: 50,
            angle: 0.0,
            showShadow: true,
            menuBackgroundColor: Colors.transparent,
            style: DrawerStyle.defaultStyle,
            menuScreen: const MyMenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(
                gradient: mainGradient(),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobilescreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleDrawer();
                            },
                            child: const Icon(
                              AppIcons.menuLeft,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                  model:
                                      questionPaperController.allPapers[index],
                                );
                              },
                              itemCount:
                                  questionPaperController.allPapers.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
        }),
      ),
    );
  }
}
