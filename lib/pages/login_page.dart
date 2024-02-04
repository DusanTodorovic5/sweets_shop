import 'package:flutter/material.dart';

import '../classes/landing_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      LandingBackground(
        isLanding: false,
      )
    ]);
  }
}
