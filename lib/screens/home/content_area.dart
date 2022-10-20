import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({Key? key, this.addPadding = true, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customScaffoldColor(context),
        ),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobilescreenPadding,
                left: mobilescreenPadding,
                right: mobilescreenPadding,
              )
            : EdgeInsets.zero,
      ),
    );
  }
}
