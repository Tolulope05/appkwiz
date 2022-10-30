import 'package:flutter/material.dart';

import '../../configs/themes/custom_text_style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({Key? key, this.color, required this.time})
      : super(key: key);
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        Text(
          time,
          style: countDownTimerTS(),
        )
      ],
    );
  }
}
