import 'package:flutter/material.dart';
import 'package:sweets_shop/pages/login_page.dart';

import '../classes/landing_background.dart';
import '../classes/pallete.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LandingBackground(
            isLanding: false,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 35.0),
                child: Text(
                  "Signup Activity",
                  style: TextStyle(
                    color: Pallete.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              createTextFieldContainer(context),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox createTextFieldContainer(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          color: Pallete.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Pallete.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type username here',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Pallete.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: '********',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Pallete.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type email here',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 > 500
                      ? 500
                      : MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Pallete.white,
                      backgroundColor: Pallete.pink,
                      shadowColor: Colors.black,
                      elevation: 8,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Pallete.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
