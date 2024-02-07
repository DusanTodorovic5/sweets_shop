import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../pallete.dart';
import "base_app_bar.dart";

class PhoneAppBar extends BaseAppBar {
  const PhoneAppBar({super.key, required currentPage})
      : super(currentPage: currentPage);

  @override
  State<BaseAppBar> createState() => PhoneAppBarState<PhoneAppBar>();
}

class PhoneAppBarState<T extends PhoneAppBar> extends BaseAppBarState<T> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.person,
          color: Pallete.pink,
          size: 45,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Pallete.pink,
              size: 45,
            ),
            Icon(
              Icons.notifications,
              color: Pallete.pink,
              size: 45,
            ),
          ],
        )
      ],
    );
  }
}
