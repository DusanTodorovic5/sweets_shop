import 'package:sweets_shop/classes/comment.dart';

enum Category {
  cake,
  sweet,
  none,
}

class Product {
  final String name;
  final String description;
  final Category category;
  final List<String> ingridients;
  final List<Comment> comments;
  final int price;

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.ingridients,
    required this.comments,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json["comments"] == null) {
      json["comments"] = [];
    }

    return Product(
      name: json['name'],
      description: json['description'],
      category: categoryFromJson(json['category']),
      ingridients: (json['ingredients'] as List)
          .map((ingredient) => ingredient.toString())
          .toList(),
      comments: (json["comments"] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      price: json['price'],
    );
  }

  String get imagePath => "${category.name}/${name.replaceAll(" ", "_")}.png";
}

Category categoryFromJson(String category) {
  switch (category) {
    case 'Sweet':
      return Category.sweet;
    case 'Cake':
      return Category.cake;
  }
  return Category.none;
}
