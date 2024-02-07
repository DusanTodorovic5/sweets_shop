import 'package:flutter/material.dart';
import 'package:sweets_shop/pages/home_page.dart';

import '../classes/manager.dart';
import '../classes/pallete.dart';
import '../classes/landing_background.dart';
import 'admin_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LandingBackground(
        isLanding: false,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
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
                padding: const EdgeInsets.all(40.0),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Pallete.grey,
                              ),
                              onChanged: setUsername,
                              decoration: const InputDecoration(
                                hintText: 'Type username here',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                              ),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: setPassword,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Pallete.grey,
                              ),
                              decoration: const InputDecoration(
                                hintText: '********',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16.0),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your logic to handle forgot password
                          },
                          child: const Text(
                            'Don\'t remember password? Recover it.',
                            style: TextStyle(
                              color: Pallete.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8 > 300
                            ? 300
                            : MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () => tryLogin(context),
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
                              "Sign In",
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
        },
      ),
    );
  }

  void setUsername(String value) => username = value;
  void setPassword(String value) => password = value;

  void tryLogin(context) {
    if (!Manager().canLogin(username, password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Wrong username or password",
          ),
        ),
      );
      return;
    }

    if (!Manager().canLoginOnPlatform) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Admin can only open web version of application",
          ),
        ),
      );
      return;
    }

    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Manager().user.isAdmin ? const AdminPage() : const HomePage(),
      ),
    );
  }
}
