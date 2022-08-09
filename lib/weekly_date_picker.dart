library weekly_date_picker;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/week_of_year.dart';
import "package:weekly_date_picker/datetime_apis.dart";

class WeeklyDatePicker extends StatefulWidget {
  WeeklyDatePicker({
    Key? key,
    required this.selectedDay,
    required this.changeDay,
    this.weekdayText = 'Week',
    this.weekdays = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    this.backgroundColor = const Color(0xFFFAFAFA),
    this.selectedBackgroundColor = const Color(0xFF2A2859),
    this.selectedDigitColor = const Color(0xFFFFFFFF),
    this.digitsColor = const Color(0xFF000000),
    this.weekdayTextColor = const Color(0xFF303030),
    this.enableWeeknumberText = true,
    this.weeknumberColor = const Color(0xFFB2F5FE),
    this.weeknumberTextColor = const Color(0xFF000000),
    this.daysInWeek = 7,
    required this.pageController,
    required this.callbackIndex,
  })  : assert(weekdays.length == daysInWeek,
            "weekdays must be of length $daysInWeek"),
        super(key: key);

  /// The current selected day
  final DateTime selectedDay;

  /// Callback function with the new selected date
  final Function(DateTime) changeDay;

  /// Specifies the weekday text: default is 'Week'
  final String weekdayText;

  /// Specifies the weekday strings ['Mon', 'Tue'...]
  final List<String> weekdays;

  /// Background color
  final Color backgroundColor;

  /// Color of the selected digits text
  final Color selectedBackgroundColor;

  /// Color of the unselected digits text
  final Color selectedDigitColor;

  /// Color of the unselected digits text
  final Color digitsColor;

  /// Is the color of the weekdays 'Mon', 'Tue'...
  final Color weekdayTextColor;

  /// Set to false to hide the weeknumber textfield to the left of the slider
  final bool enableWeeknumberText;

  /// Color of the weekday container
  final Color weeknumberColor;

  /// Color of the weekday text
  final Color weeknumberTextColor;

  /// Specifies the number of weekdays to render, default is 7, so Monday to Sunday
  final int daysInWeek;

  Function(PageController controller) pageController;
  Function(int index) callbackIndex;

  @override
  _WeeklyDatePickerState createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  final DateTime _todaysDateTime = DateTime.now();

  // About 100 years back in time should be sufficient for most users, 52 weeks * 100
  final int _weekIndexOffset = 5200;

  late final PageController _controller;
  late final DateTime _initialSelectedDay;
  late String _weeknumberInSwipe;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = _weekIndexOffset;
    _controller = PageController(initialPage: _weekIndexOffset);
    widget.pageController(_controller);
    _initialSelectedDay = widget.selectedDay;
    _weeknumberInSwipe = convertDateToMMYYYY(widget.selectedDay);
  }

  String convertDateToMMYYYY(DateTime date) =>
      DateFormat('MM/yyyy').format(date);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Column(
        children: <Widget>[
          widget.enableWeeknumberText
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  color: widget.weeknumberColor,
                  child: Text(
                    _weeknumberInSwipe,
                    style: TextStyle(color: widget.weeknumberTextColor),
                  ),
                )
              : Container(),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      // if (currentIndex > 0)
                      _controller.jumpToPage(currentIndex - 1);
                    },
                    icon: Icon(Icons.add)),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (int index) {
                      currentIndex = index;
                      print("TAG index $index");
                      setState(() {
                        widget.callbackIndex(index);
                        var test = _initialSelectedDay.add(
                            Duration(days: 7 * (index - _weekIndexOffset)));
                        print("TAG _initialSelectedDay:${test}");
                        _weeknumberInSwipe = convertDateToMMYYYY(
                            _initialSelectedDay.add(Duration(
                                days: 7 * (index - _weekIndexOffset))));
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, weekIndex) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _weekdays(weekIndex - _weekIndexOffset),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _controller.jumpToPage(currentIndex + 1);
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Builds a 5 day list of DateButtons
  List<Widget> _weekdays(int weekIndex) {
    List<Widget> weekdays = [];

    for (int i = 0; i < widget.daysInWeek; i++) {
      final int offset = i + 1 - _initialSelectedDay.weekday;
      final int daysToAdd = weekIndex * 7 + offset;
      final DateTime dateTime =
          _initialSelectedDay.add(Duration(days: daysToAdd));
      weekdays.add(_dateButton(dateTime));
    }
    return weekdays;
  }

  Widget _dateButton(DateTime dateTime) {
    final String weekday = widget.weekdays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDateAs(widget.selectedDay);

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.changeDay(dateTime),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Text(
                  '$weekday',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: isSelected
                          ? widget.selectedDigitColor
                          : widget.digitsColor),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                    // Border around today's date
                    color: dateTime.isSameDateAs(_todaysDateTime)
                        ? Colors.transparent
                        : Colors.transparent,
                    shape: BoxShape.circle),
                child: Text(
                  '${dateTime.day}',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: isSelected
                          ? widget.selectedDigitColor
                          : widget.digitsColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
