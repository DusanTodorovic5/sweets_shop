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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: widget.currentPage.pageType == PageType.full,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Pallete.pink,
              size: 30,
            ),
          ),
        ),
        Visibility(
          visible: widget.currentPage.pageType == PageType.onlyLeft ||
              widget.currentPage.pageType == PageType.full,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Pallete.pink,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Pallete.pink,
                  size: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
