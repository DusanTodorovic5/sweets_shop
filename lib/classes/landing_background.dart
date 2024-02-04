import 'package:flutter/material.dart';

import 'pallete.dart';

class LandingBackground extends StatelessWidget {
  final bool isLanding;
  const LandingBackground({super.key, required this.isLanding});

  @override
  Widget build(BuildContext context) {
    bool vertical = MediaQuery.of(context).size.aspectRatio <= 1.0;

    CustomBackground backgroundPainter = isLanding
        ? LandingBackgroundPainter(vertical)
        : BackgroundLoginRegister(vertical);

    return Container(
      color: Pallete.lightPurple,
      child: CustomPaint(
        painter: backgroundPainter,
        child: Container(),
      ),
    );
  }
}

class CustomBackground extends CustomPainter {
  bool vertical = true;
  CustomBackground(this.vertical);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LandingBackgroundPainter extends CustomBackground {
  double triangleStartHeight = 0.36;
  double sideTriangleEnd = 0.65;

  LandingBackgroundPainter(bool vertical) : super(vertical) {
    triangleStartHeight = vertical ? 0.36 : 0.15;
    sideTriangleEnd = vertical ? 0.64 : 0.85;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path topTriangle = Path();
    topTriangle.moveTo(0, 0);
    topTriangle.lineTo(size.width, 0);
    topTriangle.lineTo(size.width, triangleStartHeight * size.height);
    topTriangle.lineTo(size.width / 2, 0.5 * size.height);
    topTriangle.lineTo(0, triangleStartHeight * size.height);
    topTriangle.close();

    paint.color = Pallete.white;
    canvas.drawPath(topTriangle, paint);

    Path sideTriangle = Path();
    sideTriangle.moveTo(size.width, triangleStartHeight * size.height);
    sideTriangle.lineTo(size.width / 2, 0.5 * size.height);
    sideTriangle.lineTo(size.width, sideTriangleEnd * size.height);
    sideTriangle.close();

    paint.color = Pallete.darkPurple;
    canvas.drawPath(sideTriangle, paint);
  }
}

class BackgroundLoginRegister extends CustomBackground {
  BackgroundLoginRegister(bool vertical) : super(vertical);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path sideTriangle = Path();
    sideTriangle.moveTo(0, 0);
    sideTriangle.lineTo(0, size.height);

    double width = size.width * 0.8;
    if (width > 600) {
      width = 600;
    }

    sideTriangle.lineTo(width, size.height);
    sideTriangle.close();

    paint.color = Pallete.darkPurple;
    canvas.drawPath(sideTriangle, paint);
  }
}
