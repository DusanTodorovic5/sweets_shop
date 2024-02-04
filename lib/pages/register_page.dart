import 'package:flutter/material.dart';

import '../classes/landing_background.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      LandingBackground(
        isLanding: false,
      )
    ]);
  }
}
