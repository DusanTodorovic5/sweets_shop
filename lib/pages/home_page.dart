import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/manager.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/pages/list_products.dart';
import 'package:sweets_shop/pages/product_page.dart';

import '../classes/product.dart';
import '../classes/page_with_type.dart';

class HomePage extends StatelessWidget implements PageWithType {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(this),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                return CarouselSlider(
                  options: CarouselOptions(
                    height: Size.infinite.height,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: Manager()
                      .top6
                      .map(
                        (item) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: item,
                                ),
                              ),
                            );
                          },
                          child: getCarouselImage(
                            item,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
              top: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("More Cakes", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListProductsPage(
                        products: Manager().cakes,
                      ),
                    ),
                  );
                }),
                createButton("More Sweets", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListProductsPage(
                        products: Manager().sweets,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCarouselImage(Product item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  height: Size.infinite.height,
                ),
              ),
              Container(
                width: Size.infinite.width,
                height: Size.infinite.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(0, 0, 0, 0.3),
                      Color.fromRGBO(0, 0, 0, 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          color: Pallete.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.description,
                        style: const TextStyle(
                          color: Pallete.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createButton(String text, Function action) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => action(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Pallete.white,
          backgroundColor: Pallete.pink,
          shadowColor: Colors.black,
          elevation: 8,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 32,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Pallete.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  PageType get pageType => PageType.full;
}
