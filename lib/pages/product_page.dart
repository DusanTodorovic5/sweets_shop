import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';
import 'package:sweets_shop/classes/pallete.dart';
import 'package:sweets_shop/classes/product.dart';

import '../classes/manager.dart';

class ProductPage extends StatefulWidget implements PageWithType {
  const ProductPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();

  @override
  PageType get pageType => PageType.onlyRight;
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(widget),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.product.description,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                widget.product.imagePath,
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: ExpansionTile(
                  backgroundColor: Pallete.white,
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Expand for Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.product.ingridients
                              .map(
                                (e) => Text(
                                  "${widget.product.ingridients.indexOf(e) + 1}: $e",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  bottom: 8,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView(
                  shrinkWrap: true,
                  children: widget.product.comments.map((e) {
                    return Card(
                      elevation: 1,
                      color: Pallete.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                e.user,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e.text,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton("Leave a comment", leaveAComment),
                createButton("Add to cart", addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }

  void leaveAComment() {
    showCommentDialog(context).then((value) {
      if (value != null && value.isNotEmpty) {
        if (Manager().leaveAComment(widget.product, value)) {
          setState(() {});
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to add comment'),
        ));
      }
    });
  }

  void addToCart() => Manager().addToCart(widget.product);

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

  Future<String?> showCommentDialog(BuildContext context) async {
    TextEditingController commentController = TextEditingController();

    var dialog = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Leave a Comment"),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(hintText: "Write Comment"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(commentController.text);
              },
              child: const Text('Leave a comment'),
            ),
          ],
        );
      },
    );

    return dialog != null || commentController.text.isEmpty
        ? commentController.text
        : null;
  }
}
