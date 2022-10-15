import 'package:appkwiz/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplictionIntroductionScreen extends StatelessWidget {
  const ApplictionIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.star,
              size: 65,
              color: Colors.amber,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
                "This is a study app, You can use it as you want, If you understand how it works you would be able to scale it"),
            SizedBox(
              height: 40,
            ),
            AppCircleButton(
              onTap: null,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}