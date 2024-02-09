import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/product.dart';

import '../classes/manager.dart';
import '../classes/pallete.dart';
import '../main.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: leftSide(context),
                ),
                Expanded(
                  child: rightSide(context),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Manager().logout();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }

  Widget leftSide(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            children: [
              Card(
                child: Column(
                  children: [
                    const Text(
                      "User: Dusan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Chocolate cake x1",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Tiramisu x3",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total: \$25",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Pallete.white,
                                  backgroundColor: Pallete.pink,
                                  shadowColor: Colors.black,
                                  elevation: 8,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Approve",
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Pallete.white,
                                  backgroundColor: Pallete.pink,
                                  shadowColor: Colors.black,
                                  elevation: 8,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Decline",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rightSide(context) {
    return Container(
      color: Pallete.grey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "New Product",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.add_a_photo,
              size: 150,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const TextField(
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Pallete.grey,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const TextField(
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Pallete.grey,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Ingridients",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const TextField(
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Pallete.grey,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Price",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const TextField(
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Pallete.grey,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Product p = Product(
                  name: "Chocolate Cake",
                  description: "description",
                  category: Category.cake,
                  ingridients: [
                    "a",
                    "b",
                  ],
                  comments: [],
                  price: 10,
                );
                Manager().addProduct(p);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Pallete.white,
                backgroundColor: Pallete.pink,
                shadowColor: Colors.black,
                elevation: 8,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "Add product",
                  style: TextStyle(
                    color: Pallete.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
