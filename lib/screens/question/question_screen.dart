import 'package:flutter/material.dart';

import '../../widgets/common/background_decoration.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  static const routeName = '/questionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundDecoration(
      child: Center(child: Text("Hello")),
    ));
  }
}
