import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/notification_service.dart';
import 'package:intl/intl.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationService notificationService = NotificationService();

  final int maxTitleLength = 60;
  TextEditingController _textEditingController =
      TextEditingController(text: "Business meeting");

  int segmentedControlGroupValue = 0;

  DateTime currentDate = DateTime.now();
  DateTime? eventDate;


  Future<void> onCreate() async {
    await notificationService.showNotification(
      0,
  "Test",
      "A new event has been created.",
      jsonEncode({
        "title": "Title",
        "eventDate": "OPK",
        "eventTime": "OKE",
      }),
    );
  }

  Future<void> cancelAllNotifications() async {
    await notificationService.cancelAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(payload: null),
                ),
              );
            },
            icon: Icon(Icons.library_books_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () => onCreate(), child: Text('Show notify'))
          ],
        ),
      ),
    );
  }

  Widget _buildCancelAllButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.indigo[100],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cancel all the reminders",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Icon(Icons.clear),
        ],
      ),
    );
  }
}
