import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {Key? key, this.color, required this.child, this.width = 60, this.onTap})
      : super(key: key);
  final Color? color;
  final Widget child;
  final double width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        child: child,
      ),
    );
  }
}
