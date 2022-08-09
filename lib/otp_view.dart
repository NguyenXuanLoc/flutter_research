import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AutoFocusChangeOnSameChar extends StatefulWidget {
  AutoFocusChangeOnSameChar({Key? key}) : super(key: key);

  @override
  _AutoFocusChangeOnSameCharState createState() =>
      _AutoFocusChangeOnSameCharState();
}

class _AutoFocusChangeOnSameCharState extends State<AutoFocusChangeOnSameChar> {
  late FocusNode text1, text2, text3;

  @override
  void initState() {
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 30,
          child: TextField(
            focusNode: text1,
            onChanged: (value) {
              if (value.length > 0) {
                FocusScope.of(context).requestFocus(text2);
              }
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 30,
          child: TextField(
            focusNode: text2, inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
            onChanged: (value) {
              if (value.length > 0) {
                FocusScope.of(context).requestFocus(text3);
              } else {
                FocusScope.of(context).requestFocus(text1);
              }
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 30,
          child: TextField(
            focusNode: text3,
            onChanged: (value) {
              if (value.length > 0) {
                FocusScope.of(context).requestFocus(new FocusNode());
              }
            },
          ),
        ),
      ],
    );
  }
}
