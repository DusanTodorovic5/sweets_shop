import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/pages/landing_page.dart';

import 'classes/manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Manager().loadProducts();
  await Manager().loadUsers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Pallete.pink,
        ),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: Material(
          child: LandingPage(),
        ),
      ),
    );
  }
}
