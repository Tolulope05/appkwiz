import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common/background_decoration.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({Key? key}) : super(key: key);
  static const routeName = '/questionScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BackgroundDecoration(
      child: Center(child: Text("Hello")),
    ));
  }
}
