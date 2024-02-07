import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../classes/manager.dart';

class ProfilePage extends StatefulWidget implements PageWithType {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  PageType get pageType => PageType.nothing;
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(
        widget,
        header: "Account Settings",
        trailing: IconButton(
          icon: const Icon(
            Icons.logout,
          ),
          onPressed: () {
            print("a");
          },
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
