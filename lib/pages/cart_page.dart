import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';
import 'package:sweets_shop/classes/pallete.dart';

import '../classes/manager.dart';

class CartPage extends StatefulWidget implements PageWithType {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

  @override
  PageType get pageType => PageType.nothing;
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(
        widget,
        header: "My Cart",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Pallete.pink,
            borderRadius: BorderRadius.all(
              Radius.circular(
                22,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 22,
            ),
            child: Text(
              "Checkout (${Manager().sumOfCart})",
              style: const TextStyle(
                color: Pallete.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Manager().cart.isEmpty
          ? const Center(
              child: Text(
                "You have no items in cart...",
              ),
            )
          : ListView(
              children: Manager().cart.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 0,
                    color: Pallete.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 4,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.product.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Manager().deleteFromCart(e);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.priceStr,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Manager().decrementInCart(e);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  Text(e.count.toString()),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Manager().incrementInCart(e);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
