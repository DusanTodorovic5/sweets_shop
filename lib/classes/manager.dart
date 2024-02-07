import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sweets_shop/classes/appbar/phone_app_bar.dart';
import 'package:sweets_shop/classes/cart_item.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/classes/user.dart';

import 'appbar/web_app_bar.dart';
import 'comment.dart';
import 'page_with_type.dart';
import 'product.dart';

class Manager {
  static final Manager _singleton = Manager._internal();
  factory Manager() => _singleton;
  Manager._internal();

  List<User> users = [];
  List<Product> products = [];

  User user = User.empty;

  List<CartItem> cart = [];

  Future<void> loadUsers() async {
    String jsonString = await rootBundle.loadString('assets/users.json');
    List<dynamic> jsonList = json.decode(jsonString);
    users = jsonList.map((json) => User.fromJson(json)).toList();
  }

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

  AppBar getAppBar(
    PageWithType currentPage, {
    String header = "",
    Widget? trailing,
  }) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: !kIsWeb,
      iconTheme: const IconThemeData(
        color: Pallete.pink,
      ),
      title: kIsWeb
          ? WebAppBar(currentPage: currentPage)
          : PhoneAppBar(
              currentPage: currentPage,
              header: header,
              trailingIcon: trailing,
            ),
    );
  }

  bool leaveAComment(Product product, String text) {
    int index = products.indexOf(product);

    if (index >= 0) {
      products[index].comments.add(Comment(text: text, user: user.username));
    }

    return index >= 0;
  }

  bool addToCart(Product product) {
    for (CartItem cartItem in cart) {
      if (cartItem.product == product) {
        return false;
      }
    }

    cart.add(CartItem(product: product));
    return true;
  }

  bool incrementInCart(CartItem item) {
    int index = cart.indexOf(item);

    if (index > -1) {
      cart[index].increment();
      return true;
    }

    return false;
  }

  bool decrementInCart(CartItem item) {
    int index = cart.indexOf(item);

    if (index > -1) {
      return cart[index].decrement();
    }

    return false;
  }

  bool deleteFromCart(CartItem item) {
    return cart.remove(item);
  }

  int get sumOfCart {
    int sum = 0;

    for (CartItem item in cart) {
      sum += item.price;
    }

    return sum;
  }

  bool get canLoginOnPlatform =>
      !kIsWeb || user.username.toLowerCase() != "admin";

  bool canLoginUser(User user, String password) {
    if (user.canLogin(password)) {
      this.user = user;
      return true;
    }

    return false;
  }

  bool canLogin(String username, String password) {
    for (User user in users) {
      if (user.username == username) {
        return canLoginUser(user, password);
      }
    }

    return false;
  }

  void logout() {
    user = User.empty;
  }
}
