import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/manager.dart';
import 'package:sweets_shop/pages/home_page.dart';
import 'package:sweets_shop/pages/list_products.dart';

import '../../main.dart';
import '../../pages/cart_page.dart';
import '../../pages/notifications_page.dart';
import '../../pages/profile_page.dart';
import '../pallete.dart';
import "base_app_bar.dart";

class WebAppBar extends BaseAppBar {
  const WebAppBar({
    super.key,
    required currentPage,
    required this.underlineName,
  }) : super(currentPage: currentPage);

  final String underlineName;

  @override
  State<BaseAppBar> createState() => WebAppBarState<WebAppBar>();
}

class WebAppBarState<T extends WebAppBar> extends BaseAppBarState<T> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => switchPage(
                const HomePage(),
              ),
              child: Image.asset(
                "assets/logo.png",
                height: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            createTextButton(
              "Cakes",
              () => switchPage(ListProductsPage(products: Manager().cakes)),
            ),
            const SizedBox(
              height: 10,
            ),
            createTextButton(
              "Sweets",
              () => switchPage(ListProductsPage(products: Manager().sweets)),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            createTextButton(
              "Cart",
              () => switchPage(
                const CartPage(),
              ),
            ),
            createTextButton(
              "Notifications",
              () => switchPage(
                NotificationsPage(),
              ),
            ),
            createTextButton(
              "Profile",
              () => switchPage(
                ProfilePage(),
              ),
            ),
            createTextButton("Logout", () {
              Manager().logout();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget createTextButton(String text, Function() action) {
    return TextButton(
      onPressed: action,
      child: Text(
        text,
        style: TextStyle(
          color: Pallete.white,
          fontSize: 22,
          decoration: text == widget.underlineName
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: Pallete.white,
          decorationThickness: 2.0,
        ),
      ),
    );
  }

  void switchPage(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
