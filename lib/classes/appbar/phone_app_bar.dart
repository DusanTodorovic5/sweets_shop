import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';
import 'package:sweets_shop/pages/profile_page.dart';

import '../../pages/cart_page.dart';
import '../../pages/notifications_page.dart';
import '../pallete.dart';
import "base_app_bar.dart";

class PhoneAppBar extends BaseAppBar {
  const PhoneAppBar({
    super.key,
    required currentPage,
    this.header = "",
    this.trailingIcon,
  }) : super(currentPage: currentPage);

  final String header;
  final Widget? trailingIcon;

  @override
  State<BaseAppBar> createState() => PhoneAppBarState<PhoneAppBar>();
}

class PhoneAppBarState<T extends PhoneAppBar> extends BaseAppBarState<T> {
  @override
  Widget build(BuildContext context) {
    if (widget.currentPage.pageType == PageType.nothing) {
      return widget.trailingIcon == null
          ? rowWithHeaderOnly
          : rowWithTrailingIcon;
    }

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
              size: 30,
            ),
          ),
        ),
        Text(
          widget.header,
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
                  size: 30,
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
                  size: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget get rowWithHeaderOnly {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.header,
          style: const TextStyle(
            fontSize: 25,
            color: Pallete.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget get rowWithTrailingIcon {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            widget.header,
            style: const TextStyle(
              fontSize: 25,
              color: Pallete.pink,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        widget.trailingIcon!
      ],
    );
  }
}
