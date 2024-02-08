import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../classes/manager.dart';
import '../classes/product.dart';
import 'product_page.dart';

class ListProductsPage extends StatelessWidget implements PageWithType {
  ListProductsPage({super.key, required this.products});

  List<Product> products = [];

  @override
  PageType get pageType => PageType.onlyRight;

  String get pageName =>
      products[0].category == Category.cake ? "Cakes" : "Sweets";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(
        this,
        currentName: pageName,
      ),
      body: Manager().isWeb
          ? createGridListForWeb(context)
          : createMobilePhoneList(context),
    );
  }

  GridView createGridListForWeb(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: productsToWidgets(context),
    );
  }

  ListView createMobilePhoneList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: productsToWidgets(context),
    );
  }

  List<InkWell> productsToWidgets(BuildContext context) {
    return products
        .map(
          (e) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(product: e),
                ),
              );
            },
            child: createProductTile(e),
          ),
        )
        .toList();
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
                height: Manager().isWeb ? 250 : 150.0,
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
