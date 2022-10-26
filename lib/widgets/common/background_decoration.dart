import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    Key? key,
    required this.child,
    this.showGradient = false,
  }) : super(key: key);
  final Widget child;
  final bool showGradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: showGradient ? null : Theme.of(context).primaryColor,
              gradient: showGradient ? mainGradient() : null,
            ),
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
        ),
        Positioned(child: child)
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    //..color means from Paint object you take the color type and assign color to it same with below
    // Paint paint1 = Paint();
    // paint1.color = Colors.white;
    final path = Path();
    final path2 = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();
    canvas.drawPath(path, paint);
    // Path2
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width * 0.8, 0);
    path2.lineTo(size.width * 0.2, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
