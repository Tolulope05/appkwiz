import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/widgets/common/background_decoration.dart';
import 'package:appkwiz/widgets/common/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/test-overview";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: "Test Over"),
      body: BackgroundDecoration(
          child: Center(
        child: Text("Test Completed"),
      )),
    );
  }
}
