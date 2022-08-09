import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'date_picker_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var month = DateFormat('MM/yyyy').format(DateTime.now());
  var datePickerController = DatePickerController();
  var currentDate = DateTime.now();
  var dateMove = DateTime.now();
  var threeDay = 86400000 * 5;

  @override
  void initState() {
    super.initState();
  }

  void moveToLeft() {
    print("TAG moveToLeft: ${dateMove.day}");
    dateMove = DateTime.fromMillisecondsSinceEpoch(
        dateMove.millisecondsSinceEpoch - threeDay);
    month = DateFormat('MM/yyyy').format(dateMove);
    setState(() {});
    datePickerController.animateToDate(dateMove);
  }

  void moveToRight() {
    dateMove = DateTime.fromMillisecondsSinceEpoch(
        dateMove.millisecondsSinceEpoch + threeDay);
    month = DateFormat('MM/yyyy').format(dateMove);
    setState(() {});
    print("TAG moveToRight: ${dateMove.day}");
    datePickerController.animateToDate(dateMove);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              month.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 20,
                    constraints: BoxConstraints(maxWidth: 30),
                    onPressed: () {
                      moveToLeft();
                      print("TAG onPress");
                    },
                    icon: Icon(
                      Icons.nest_cam_wired_stand_sharp,
                      size: 20,
                    )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: DatePicker(
                    DateTime.now(),
                    controller: datePickerController,
                    width: 40,
                    dayTextStyle: TextStyle(fontSize: 17),
                    monthTextStyle: TextStyle(fontSize: 17),
                    dateTextStyle: TextStyle(fontSize: 17),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.grey,
                    selectedTextColor: Colors.blue,
                    onDateChange: (date) {
                      currentDate = date;
                      month = DateFormat('MM/yyyy').format(date);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    splashRadius: 20,
                    constraints: BoxConstraints(maxWidth: 30),
                    onPressed: () {
                      moveToRight();
                      print("TAG onPress");
                    },
                    icon: Icon(
                      Icons.nest_cam_wired_stand_sharp,
                      size: 20,
                    )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
