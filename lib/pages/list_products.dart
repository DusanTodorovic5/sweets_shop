import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';

import '../classes/product.dart';

class ListProductsPage extends StatelessWidget {
  ListProductsPage({super.key, required this.products});

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
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
        ),
      ),
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
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Pallete.pink,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: Image.asset(
                product.imagePath,
                width: double.infinity,
                height: 200.0,
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
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Pallete.white,
                      fontSize: 14.0,
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
