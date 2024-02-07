import 'product.dart';

class CartItem {
  final Product product;
  int count = 1;

  CartItem({required this.product});

  void increment() => count++;
  bool decrement() => count != 0 ? --count != 0 : false;

  int get price => count * product.price;

  String get priceStr => "\$$price";
}
