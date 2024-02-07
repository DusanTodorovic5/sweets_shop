import 'package:flutter/material.dart';

import '../page_with_type.dart';

abstract class BaseAppBar extends StatefulWidget {
  const BaseAppBar({Key? key, required this.currentPage}) : super(key: key);

  final PageWithType currentPage;

  @override
  State<BaseAppBar> createState();

  bool hasBackButton(context) => ModalRoute.of(context)?.canPop ?? false;
}

// Define an abstract class that extends State
abstract class BaseAppBarState<T extends BaseAppBar> extends State<T> {}
