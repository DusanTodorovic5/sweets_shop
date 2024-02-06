import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'product.dart';

class Manager {
  static final Manager _singleton = Manager._internal();
  List<Product> products = [];

  factory Manager() {
    return _singleton;
  }

  Manager._internal();

  Future<void> loadProducts() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);
    products = jsonList.map((json) => Product.fromJson(json)).toList();
  }

  List<Product> get cakes {
    return products
        .where((element) => element.category == Category.cake)
        .toList();
  }

  List<Product> get sweets {
    return products
        .where((element) => element.category == Category.sweet)
        .toList();
  }

  List<Product> get top6 {
    var shuffledProducts = products.toList();
    shuffledProducts.shuffle();
    return shuffledProducts.sublist(0, 6);
  }
}
