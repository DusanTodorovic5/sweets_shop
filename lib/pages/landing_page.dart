import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';

import '../classes/landing_background.dart';
import 'login_page.dart';
import 'register_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LandingBackground(
          isLanding: true,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 300,
                  ),
                  const Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Pallete.darkPurple,
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sweets Shop",
                    style: TextStyle(
                      color: Pallete.darkPurple,
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login or create account to\naccess our application",
                    style: TextStyle(
                      color: Pallete.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 > 500
                        ? 500
                        : MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: createElevatedButtonStyle(),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Pallete.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 > 500
                        ? 500
                        : MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: createElevatedButtonStyle(),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Pallete.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ButtonStyle createElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: Pallete.white,
      backgroundColor: Pallete.pink,
      shadowColor: Colors.black,
      elevation: 8,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
    );
  }
}
