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
  LandingBackgroundPainter(bool vertical) : super(vertical);

  @override
  void paint(Canvas canvas, Size size) {
    double triangleStartHeight = interpolate(size.width);
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
    sideTriangle.lineTo(size.width, (1 - triangleStartHeight) * size.height);
    sideTriangle.close();

    paint.color = Pallete.darkPurple;
    canvas.drawPath(sideTriangle, paint);
  }

  double interpolate(double currentWidth) {
    if (currentWidth > 1343) return 0.15;
    if (currentWidth < 595) return 0.36;

    return 0.36 + (currentWidth - 595) * (0.15 - 0.36) / (1343 - 595);
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
