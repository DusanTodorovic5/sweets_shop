import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../classes/manager.dart';
import '../classes/product.dart';

class ListProductsPage extends StatelessWidget implements PageWithType {
  ListProductsPage({super.key, required this.products});

  List<Product> products = [];

  @override
  PageType get pageType => PageType.onlyLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(this),
      body: ListView(
        shrinkWrap: true,
        children: products
            .map(
              (e) => createProductTile(e),
            )
            .toList(),
      ),
    );
  }

  Widget createProductTile(Product product) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Pallete.pink,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                product.imagePath,
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Pallete.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Pallete.white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
