import 'package:flutter/material.dart';
import 'package:sweets_shop/classes/page_with_type.dart';

import '../classes/manager.dart';

class NotificationsPage extends StatefulWidget implements PageWithType {
  NotificationsPage({super.key});

  final List<String> notifications = [
    "Administrator approved your order",
    "Administrator approved your order",
    "Administrator did not approve your order",
  ];

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();

  @override
  PageType get pageType => PageType.nothing;
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Manager().getAppBar(
        widget,
        header: "Notifications",
        currentName: "Notifications",
      ),
      body: ListView(
        children: widget.notifications.map((e) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.notifications.remove(e);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
