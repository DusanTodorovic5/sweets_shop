import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../classes/manager.dart';
import '../classes/pallete.dart';
import '../classes/user.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget implements PageWithType {
  ProfilePage({super.key}) {
    user = Manager().user;
  }

  User user = User(
    username: "",
    password: "",
    category: "",
    email: "",
    name: "",
    surname: "",
    address: "",
  );

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  PageType get pageType => PageType.nothing;
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController addressController;

  String oldPassword = "";
  String newPassword = "";
  String repeatNewPassword = "";

  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  late TextEditingController repeatePasswordController;

  @override
  void initState() {
    super.initState();
    user = widget.user.copy();

    emailController = TextEditingController(
      text: user.email,
    );

    usernameController = TextEditingController(
      text: user.username,
    );

    nameController = TextEditingController(
      text: user.name,
    );

    surnameController = TextEditingController(
      text: user.surname,
    );

    addressController = TextEditingController(
      text: user.address,
    );

    passwordController = TextEditingController(
      text: oldPassword,
    );

    newPasswordController = TextEditingController(
      text: newPassword,
    );

    repeatePasswordController = TextEditingController(
      text: repeatNewPassword,
    );
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    usernameController.dispose();
    nameController.dispose();
    surnameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    repeatePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Manager().isWeb
              ? [
                  createButton(
                    "Save",
                    () {},
                  ),
                ]
              : [
                  createButton(
                    "Save",
                    () {},
                  ),
                  createButton(
                    "Change password",
                    () {
                      showModalBottomSheet(
                        backgroundColor: Pallete.white,
                        context: context,
                        builder: (BuildContext context) {
                          return passwordModalDialog(context);
                        },
                      );
                    },
                  ),
                ],
        ),
      ),
      appBar: Manager().getAppBar(
        widget,
        header: "Account Settings",
        currentName: "Profile",
        trailing: IconButton(
          icon: const Icon(
            Icons.logout,
          ),
          onPressed: () {
            Manager().logout();
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
            );
          },
        ),
      ),
      body: Manager().isWeb
          ? Column(
              children: [
                createMainFields(),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Pallete.pink,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                createPasswordPrompt(),
              ],
            )
          : createMainFields(),
    );
  }

  Padding createMainFields() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          createTextField(emailController, "Email"),
          createTextField(usernameController, "Username"),
          createTextField(nameController, "Name"),
          createTextField(surnameController, "Surname"),
          createTextField(addressController, "Address"),
        ],
      ),
    );
  }

  Widget createPasswordPrompt() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        createTextField(passwordController, "Old Password"),
        createTextField(newPasswordController, "New Password"),
        createTextField(repeatePasswordController, "Repeate Password"),
      ],
    );
  }

  Widget createTextField(TextEditingController controller, String fieldName) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8.0,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Pallete.pink,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Pallete.pink,
          ),
          labelText: fieldName,
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
          border: outlineBorder,
        ),
      ),
    );
  }

  OutlineInputBorder get outlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: Pallete.pink),
      );

  Widget createButton(String text, Function action) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: SizedBox(
        width: 160,
        child: ElevatedButton(
          onPressed: () => action(),
          style: ElevatedButton.styleFrom(
            foregroundColor: Pallete.white,
            backgroundColor: Pallete.pink,
            shadowColor: Colors.black,
            elevation: 8,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text,
              style: TextStyle(
                color: Pallete.white,
                fontSize: Manager().isWeb ? 28 : 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordModalDialog(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Change Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Pallete.pink,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          createTextField(passwordController, "Old Password"),
          createTextField(newPasswordController, "New Password"),
          createTextField(repeatePasswordController, "Repeate Password"),
          const SizedBox(
            height: 10,
          ),
          createButton(
            "Save",
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "User modified",
                  ),
                ),
              );
              Manager().user = user;
            },
          ),
        ],
      ),
    );
  }
}
