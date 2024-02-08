import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/product.dart';

import '../classes/manager.dart';
import '../classes/pallete.dart';
import '../pages/product_page.dart';

class WebGrid extends StatefulWidget {
  WebGrid({super.key, required this.items});

  final List<Product> items;

  @override
  State createState() => _WebGridState();
}

class _WebGridState extends State<WebGrid> {
  int _currentPage = 0;
  final int _totalPages = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 16 / 9,
                shrinkWrap: true,
                children: widget.items
                    .skip(_currentPage * 3)
                    .take(3)
                    .map((item) => InkWell(
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
                          child: createProductTile(item),
                        ))
                    .toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_currentPage != 0)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _currentPage--;
                    });
                  },
                ),
              Text('Page ${_currentPage + 1} of $_totalPages'),
              if (_currentPage < _totalPages - 1)
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                  },
                ),
            ],
          ),
        ],
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
