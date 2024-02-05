import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/pallete.dart';

final List<List<String>> imgList = [
  [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    "Chocolate Rolls",
    "Taste wonderful rolls with chocolate and cinnamon",
  ],
  [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    "Vanilla Cupcakes",
    "Delicious cupcakes with creamy vanilla frosting",
  ],
  [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    "Lemon Tart",
    "Tangy lemon filling in a buttery tart shell",
  ],
  [
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    "Blueberry Muffins",
    "Moist muffins packed with fresh blueberries",
  ],
  [
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    "Strawberry Shortcake",
    "Layers of fluffy cake with sweet strawberries and cream",
  ],
  [
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    "Peanut Butter Cookies",
    "Classic cookies with a rich peanut butter flavor",
  ]
];

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                  items: imgList.map((item) => getCarouselImage(item)).toList(),
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
                createButton("More Cakes", () {}),
                createButton("More Sweets", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCarouselImage(List<String> item) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
                child: Image.network(
                  item[0],
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
                      Color.fromRGBO(0, 0, 0, 0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        item[1],
                        style: const TextStyle(
                          color: Pallete.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item[2],
                        style: const TextStyle(
                          color: Pallete.white,
                          fontSize: 20,
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
      child: ElevatedButton(
        onPressed: () => action(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Pallete.white,
          backgroundColor: Pallete.pink,
          shadowColor: Colors.black,
          elevation: 8,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 75,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Pallete.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
