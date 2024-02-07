import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../../pages/cart_page.dart';
import '../../pages/notifications_page.dart';
import '../../pages/profile_page.dart';
import '../pallete.dart';
import "base_app_bar.dart";

class WebAppBar extends BaseAppBar {
  const WebAppBar({super.key, required currentPage})
      : super(currentPage: currentPage);

  @override
  State<BaseAppBar> createState() => WebAppBarState<WebAppBar>();
}

class WebAppBarState<T extends WebAppBar> extends BaseAppBarState<T> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: widget.currentPage.pageType == PageType.full,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Pallete.pink,
              size: 45,
            ),
          ),
        ),
        Visibility(
          visible: widget.currentPage.pageType == PageType.onlyRight ||
              widget.currentPage.pageType == PageType.full,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Pallete.pink,
                  size: 45,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Pallete.pink,
                  size: 45,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
