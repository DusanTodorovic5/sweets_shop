import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweets_shop/classes/pallete.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomBackground(),
        Center(
          child: Text("TEST"),
        ),
      ],
    );
  }
}

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.lightPurple,
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: Container(),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path topTriangle = Path();
    topTriangle.moveTo(0, 0);
    topTriangle.lineTo(size.width, 0);
    topTriangle.lineTo(size.width, 0.36 * size.height);
    topTriangle.lineTo(size.width / 2, 0.5 * size.height);
    topTriangle.lineTo(0, 0.36 * size.height);
    topTriangle.close();

    paint.color = Pallete.whiteColor;
    canvas.drawPath(topTriangle, paint);

    Path sideTriangle = Path();
    sideTriangle.moveTo(size.width, 0.36 * size.height);
    sideTriangle.lineTo(size.width / 2, 0.5 * size.height);
    sideTriangle.lineTo(size.width, 0.65 * size.height);
    sideTriangle.close();

    paint.color = Pallete.darkPurple;
    canvas.drawPath(sideTriangle, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
