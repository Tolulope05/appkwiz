import 'package:appkwiz/configs/themes/cusstom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  const AppIconText({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: detailsTextStyle.copyWith(
            color:
                Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
